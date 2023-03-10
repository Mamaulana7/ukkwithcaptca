import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:image_picker/image_picker.dart';

import '../widget/toast/custom_toach.dart';

class EditController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isFalse = false.obs;
  RxBool isLoadingUpdatedata = false.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController avatarUrl = TextEditingController();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;

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

  Future<void> ubahdata(
      String username, String email, String password, String uid) async {
    // DocumentReference doc = firestore.collection("users").doc(uid);
    try {
      if (image != null) {
        File file = File(image!.path);
        await storage.ref(username).putFile(file);
        String ext = image!.name.split(".").last;
        String upDir = "${uid}/avatar.$ext";
      }
      String avatarUrl = await storage.ref(username).getDownloadURL();
      DocumentReference doc = firestore.collection("users").doc(uid);
      await doc.update({
        "username": username,
        "email": email,
        "password": password,
        "profil": avatarUrl,
      });
      Get.back();
    } catch (e) {
      print(e);
      // CustomToast.successToast("Success", "Data Telah diubah");
      isLoadingUpdatedata.value = false;
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

  void pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image!.path);
      print(image!.name.split(".").last);
    }
    update();
  }
}
