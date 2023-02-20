import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../alldata/alldata_controller.dart';

class alldataPage extends GetView<alldataController> {
  const alldataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              Map<String, dynamic> user = snapshot.data!.data()!;
              return Scaffold();
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return Center(child: Text("Error"));
          }
        });
  }
}
