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
    final data = firestore.collection("datauser").where("status",isEqualTo: 0).snapshots();
    return data;
  }
  Stream<QuerySnapshot<Object?>> Riwayatminta() {
    final data = firestore.collection("datauser").where("status", isNotEqualTo: 0).snapshots();
    return data;
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
  updateStatus(int status, String dataid) async {
    isLoadingTolak.value = true;
    DocumentReference doc = firestore.collection("datauser").doc(dataid);
    try {
      await doc.update({"status": status});
      Get.back(); // Tutup Dialog
      status > 1
          ? CustomToast.successToast("Success", "Perjalanan Ditolak")
          : CustomToast.successToast("Success", "Perjalanan Diperbolehkan");
      isLoadingTolak.value = false;
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat merubah data",
        textConfirm: "Kembali",
        onConfirm: () {
        },
      );
    }
  }
}
