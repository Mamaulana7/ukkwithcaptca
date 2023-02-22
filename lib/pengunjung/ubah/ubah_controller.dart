import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pengunjung/ubah/ubah.dart';
import '../../widget/toast/custom_toach.dart';

class UbahController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingUpdatedata = false.obs;

  TextEditingController namaC = TextEditingController();
  TextEditingController asalC = TextEditingController();
  TextEditingController suhuC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> dapatkanData(String dataid) async {
    DocumentReference data = firestore.collection("datauser").doc(dataid);
    return data.get();
  }

  // Stream<QuerySnapshot<Object?>> streamData() {
  //   CollectionReference data1 = firestore.collection("data");
  //   return data1.snapshots();
  // }

  // Future<void> ubahdata() async {
  //   if (asalC.text.isNotEmpty && suhuC.text.isNotEmpty) {
  //     isLoading.value = true;

  //     if (isLoadingUpdatedata.isFalse) {
  //       await diubah();
  //       isLoading.value = false;
  //       namaC.text = "";
  //       asalC.text = "";
  //       suhuC.text = "";
  //     }
  //   } else {
  //     isLoading.value = false;
  //     CustomToast.errorToast('Error', 'Semua Input Harus diisi');
  //   }
  // }

  void ubahdata(String Nama, String Dari, String Suhu, String uid) async {
    DocumentReference doc = firestore.collection("datauser").doc(uid);
    try {
      await doc.update({
        "Nama": namaC.text,
        "Dari": asalC.text,
        "Suhu": suhuC.text,
        "date": DateTime.now().toIso8601String(),
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
