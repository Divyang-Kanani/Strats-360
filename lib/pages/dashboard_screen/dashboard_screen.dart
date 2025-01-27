import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strats_360/pages/dashboard_screen/cubit/listing_user_cubit.dart';
import 'package:strats_360/pages/dashboard_screen/cubit/listing_user_state.dart';
import 'package:strats_360/pages/single_screen/single_screen.dart';

class DashboardScreen extends StatelessWidget {
  static Widget create() => BlocProvider(
        create: (_) => ListingUserCubit(),
        child: DashboardScreen(),
      );

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: BlocConsumer<ListingUserCubit, ListingUserState>(
          listener: (_, state) {
            if (state is ListingExceptionState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (_, state) {
            if (state is ListingLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListingSuccessState) {
              return state.entityList.isNotEmpty
                  ? _buildListView(state, context)
                  : Text("NA");
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildListView(ListingSuccessState state, BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      itemBuilder: (_, index) {
        final model = state.entityList.elementAt(index);
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SingleScreen.create(userId: model.id!),
            ));
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text("${model.firstName} ${model.lastName}"),
              leading: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: model.avatar ?? "",
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: model.avatar ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => Divider(
        color: Colors.greenAccent,
      ),
      itemCount: state.entityList.length,
    );
  }
}
