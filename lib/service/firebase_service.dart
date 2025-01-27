import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:strats_360/dialog/custom_progress_dialog.dart';
import 'package:strats_360/pages/single_screen/model/single_user_model_entity.dart';
import 'package:strats_360/utils/custom_snackbar.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService _instance = FirebaseService._();

  factory FirebaseService() => _instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  static const String DB = "Strats-360";

  Future<void> addData({required SingleUserModelData data}) async {
    try {
      CustomProgressDialog.show();
      final docSnapshot =
          await _firebaseFirestore.collection(DB).doc("${data.id}").get();
      if (docSnapshot.exists) {
        CustomProgressDialog.dismiss();
        CustomSnackBar.show(
            message: "Data already available", color: Colors.red);
      } else {
        _firebaseFirestore
            .collection(DB)
            .doc("${data.id}")
            .set(data.toJson())
            .then(
          (value) {
            CustomProgressDialog.dismiss();
            CustomSnackBar.show(
                message: "Data Added success", color: Colors.green);
          },
        );
      }
    } on FirebaseException catch (e) {
      CustomProgressDialog.dismiss();
      CustomSnackBar.show(
          message: e.message ?? "Failed to add", color: Colors.red);
    }
  }

  // Delete Data from Firebase
  Future<void> deleteData({required String documentId}) async {
    try {
      // Check if the document exists
      CustomProgressDialog.show();
      final docSnapshot =
          await _firebaseFirestore.collection(DB).doc(documentId).get();
      if (docSnapshot.exists) {
        await _firebaseFirestore.collection(DB).doc(documentId).delete().then(
          (value) {
            CustomProgressDialog.dismiss();
            CustomSnackBar.show(
                message: "Data Deleted  success", color: Colors.green);
          },
        );
      } else {
        CustomProgressDialog.dismiss();
        CustomSnackBar.show(
            message: "Data not found for delete", color: Colors.red);
      }
    } on FirebaseException catch (e) {
      CustomProgressDialog.dismiss();
      CustomSnackBar.show(
          message: e.message ?? "Failed to add", color: Colors.red);
    }
  }

  Future<void> editData(
      {required String documentId, required String emailId}) async {
    try {
      CustomProgressDialog.show();
      final docSnapshot =
          await _firebaseFirestore.collection(DB).doc(documentId).get();
      if (docSnapshot.exists) {
        await _firebaseFirestore.collection(DB).doc(documentId).update({
          "email": emailId,
        }).then(
          (value) {
            CustomProgressDialog.dismiss();

            CustomSnackBar.show(
                message: "Email is changed check in Firebase console",
                color: Colors.green);
          },
        );
      } else {
        CustomProgressDialog.dismiss();
        CustomSnackBar.show(
            message: "Data not found for edit", color: Colors.red);
      }
    } on FirebaseException catch (e) {
      CustomProgressDialog.dismiss();
      CustomSnackBar.show(
          message: e.message ?? "Failed to add", color: Colors.red);
    }
  }

  Future<void> uploadImageToStorage(
      {required String filePath, required String fileName}) async {
    log(filePath);
    CustomProgressDialog.show();
    await _firebaseStorage
        .ref()
        .child("$DB/$fileName")
        .putFile(File(filePath))
        .then(
      (_) {
        log("Storage");
        CustomProgressDialog.dismiss();
        CustomSnackBar.show(
            message: "Image uploaded to Storage", color: Colors.green);
      },
    ).onError(
      (error, stackTrace) {
        CustomProgressDialog.dismiss();
        CustomSnackBar.show(message: error.toString(), color: Colors.red);
      },
    );
  }
}
