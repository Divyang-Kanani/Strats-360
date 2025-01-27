import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:strats_360/pages/single_screen/cubit/single_user_cubit.dart';
import 'package:strats_360/pages/single_screen/cubit/single_user_state.dart';
import 'package:strats_360/pages/single_screen/model/single_user_model_entity.dart';
import 'package:strats_360/service/firebase_service.dart';
import 'package:strats_360/utils/custom_snackbar.dart';
import 'package:path/path.dart' as p;

class SingleScreen extends StatelessWidget {
  static Widget create({required int userId}) {
    return BlocProvider(
      create: (_) => SingleUserCubit(userId: userId),
      child: SingleScreen(),
    );
  }

  const SingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: BlocConsumer<SingleUserCubit, SingleUserState>(
          listener: (_, state) {
            if (state is SingleUserExceptionState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (_, state) {
            if (state is SingleUserLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SingleUserSuccessState) {
              final model = state.modelEntity.data!;
              return _buildCenter(model, context);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCenter(SingleUserModelData model, BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10),
              subtitle: Text(model.email!),
              title: Text("${model.firstName} ${model.lastName}"),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: model.avatar ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent,
                    ),
                    child: InkWell(
                      onTap: () {
                        final baseName = p.basename(model.avatar!);
                        downloadImage(model.avatar!, baseName);
                      },
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      await FirebaseService().addData(data: model);
                    },
                    child: Text("Add")),
                TextButton(
                    onPressed: () async {
                      showEditDialog(
                          context: context, documentId: "${model.id}");
                    },
                    child: Text("Edit")),
                TextButton(
                    onPressed: () async {
                      await FirebaseService()
                          .deleteData(documentId: model.id.toString());
                    },
                    child: Text("Delete")),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> downloadImage(String imageUrl, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = p.join(directory.path, fileName);

    try {
      if (await checkIfFileExists(fileName)) {
        log("existed");
        await FirebaseService()
            .uploadImageToStorage(filePath: filePath, fileName: fileName);
      } else {
        await Dio().download(imageUrl, filePath).then(
          (value) async {
            log("downloaded");
            await FirebaseService()
                .uploadImageToStorage(filePath: filePath, fileName: fileName);
          },
        );
      }
    } catch (e) {
      CustomSnackBar.show(message: e.toString(), color: Colors.red);
    }
  }

  Future<bool> checkIfFileExists(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = p.join(directory.path, fileName);
    return File(filePath).exists();
  }

  Future<void> showEditDialog({
    required BuildContext context,
    required String documentId,
  }) async {
    // Initialize a TextEditingController
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Text('Edit Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Enter new Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (textController.text.trim().isEmpty) {
                  Navigator.of(context).pop();
                  CustomSnackBar.show(
                      message: "Email id is required", color: Colors.red);
                } else {
                  Navigator.of(context).pop();
                  await FirebaseService().editData(
                      documentId: documentId,
                      emailId: textController.text.trim());
                }
              },
              child: Text('Change'),
            ),
          ],
        );
      },
    );
  }
}
