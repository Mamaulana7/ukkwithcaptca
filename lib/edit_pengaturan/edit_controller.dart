import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/toast/custom_toach.dart';

class EditController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingUpdatedata = false.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController namaC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Stream<DocumentSnapshot<Map<String, dynamic>>> navbardata() async* {
  //   String uid = auth.currentUser!.uid;
  //   yield* firestore.collection("users").doc(uid).snapshots();
  // }

  Future<DocumentSnapshot<Object?>> editdata(String uid) async {
    DocumentReference data = firestore.collection("users").doc(uid);
    return data.get();
  }

  void ubahdata(
      String username, String email, String password, String uid) async {
    DocumentReference doc = firestore.collection("users").doc(uid);
    try {
      await doc.update({
        "username": namaC.text,
        "email": emailC.text,
        "password": passC.text,
      });
      Get.back();
      CustomToast.successToast("Success", "Data Telah diubah");
      isLoadingUpdatedata.value = false;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat merubah data",
        textConfirm: "Kembali",
        onConfirm: () {
          Get.back();
        },
      );
    }
  }
}
