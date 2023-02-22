import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../widget/toast/custom_toach.dart';

class AdminPermintaanController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatedata = false.obs;
  RxBool isLoadingTolak = false.obs;
  RxBool isLoadingTerima = false.obs;

  // final Map<String, dynamic> statusData = Get.arguments;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController terimaC = TextEditingController();

  Stream<QuerySnapshot<Object?>> Permintaan() {
    CollectionReference data = firestore.collection("datauser");
    return data.snapshots();
  }

  // Future<void> actionTerima() async {
  //   if (isLoading.isFalse) {
  //     await terima();
  //   }
  // }

  // Future<void> actionTolak() async {
  //   if (isLoading.isFalse) {
  //     await tolak();
  //   }
  // }

  // void terima(String Status, String docID) async {
  //   DocumentReference doc = firestore.collection("data").doc(docID);
  //   try {
  //     await doc.update({"status": 1});
  //   } catch (e) {
  //     Get.defaultDialog(
  //       title: "Terjadi kesalahan",
  //       middleText: "Tidak dapat merubah data",
  //       textConfirm: "Kembali",
  //       onConfirm: () {
  //         Get.back();
  //       },
  //     );
  //   }
  // }
  terima() async {
    isLoadingTolak.value = true;
    try {
      String uid = auth.currentUser!.uid;
      //memanggil collection journal yang ada di collection student
      CollectionReference<Map<String, dynamic>> dataCollection =
          await firestore.collection("users").doc(uid).collection("datauser");
      CollectionReference<Map<String, dynamic>> datasCollection =
          await firestore.collection("datauser");

      // buat uid di database baru
      var uuiddata = Uuid().v1();

      await datasCollection.doc('dataid').update({"status": 1});
      Get.back(); // Tutup Dialog
      CustomToast.successToast("Success", "Perjalanan Diperbolehkan");
      isLoadingTolak.value = false;
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

  tolak() async {
    isLoadingTolak.value = true;
    try {
      String uid = auth.currentUser!.uid;
      CollectionReference<Map<String, dynamic>> dataCollection =
          await firestore.collection("users").doc(uid).collection("datauser");
      CollectionReference<Map<String, dynamic>> datasCollection =
          await firestore.collection("datauser");

      // buat uid di database baru
      var uuiddata = Uuid().v1();

      await datasCollection.doc('status').update({'status': 2});
      Get.back(); // Tutup Dialog
      CustomToast.successToast("Success", "Perjalanan Ditolak");
      isLoadingTolak.value = false;
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
    // }
  }
}
