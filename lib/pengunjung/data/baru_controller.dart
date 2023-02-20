import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import '/controllers/page_index_controller.dart';
import '/controllers/page_index_controller.dart';
import '/widget/toast/custom_toach.dart';
import 'package:uuid/uuid.dart';
import '/pengunjung/data/baru.dart';

class BaruController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingdatabaru = false.obs;

  TextEditingController namaC = TextEditingController();
  TextEditingController asalC = TextEditingController();
  TextEditingController suhuC = TextEditingController();

  // ambil data
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> tambahdata() async {
    if (asalC.text.isNotEmpty && suhuC.text.isNotEmpty) {
      isLoading.value = true;

      if (isLoadingdatabaru.isFalse) {
        await baru();
        isLoading.value = false;
        namaC.text = "";
        asalC.text = "";
        suhuC.text = "";
      }
    } else {
      isLoading.value = false;
      CustomToast.errorToast('Error', 'Semua Input Harus diisi');
    }
  }

  baru() async {
    isLoadingdatabaru.value = false;

    try {
      String uid = auth.currentUser!.uid;
      //memanggil collection journal yang ada di collection student
      CollectionReference<Map<String, dynamic>> dataCollection =
          await firestore.collection("users").doc(uid).collection("datauser");
      CollectionReference<Map<String, dynamic>> datasCollection =
          await firestore.collection("datauser");

      var uuiddata = Uuid().v1();

      DocumentSnapshot<Map<String, dynamic>> query =
          await firestore.collection("users").doc(uid).get();
      await datasCollection.doc(uuiddata).set({
        "dataid": uuiddata,
        "user_id": uid,
        "Nama": query.data()?['username'],
        "Dari": asalC.text,
        "Suhu": suhuC.text,
        "date": DateTime.now().toIso8601String(),
        "status": 0,
      });
      CustomToast.successToast("Success", "Data Telah Ditambahkan");
      isLoadingdatabaru.value = false;
    } catch (e) {
      isLoadingdatabaru.value = false;
      CustomToast.errorToast("Error", "Error : ${e.toString()}");
    }
  }
}
