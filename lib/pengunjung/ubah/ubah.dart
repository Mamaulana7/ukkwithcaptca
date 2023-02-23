import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pengunjung/ubah/ubah_controller.dart';
import '../../widget/app_color.dart';

class UbahPage extends StatefulWidget {
  const UbahPage({super.key});

  @override
  State<UbahPage> createState() => _UbahPageState();
}

final controller = Get.find<UbahController>();

class _UbahPageState extends State<UbahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.secondary,
            fontSize: 21,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_left, size: 40),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.dapatkanData(Get.arguments['dataid']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var getdata = snapshot.data!.data() as Map<String, dynamic>;
              controller.namaC.text = getdata["Nama"];
              controller.asalC.text = getdata["Dari"];
              controller.suhuC.text = getdata["Suhu"];
              return ListView(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 15,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color.fromARGB(255, 131, 131, 131))),
                          width: 370,
                          height: 45,
                          child: TextField(
                            controller: controller.namaC,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "Nama",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 15,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color.fromARGB(255, 131, 131, 131))),
                          width: 370,
                          height: 45,
                          child: TextField(
                            controller: controller.asalC,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "Dari",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 15,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color.fromARGB(255, 131, 131, 131))),
                          width: 370,
                          height: 45,
                          child: TextField(
                            controller: controller.suhuC,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "Suhu",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 7,
                          ),
                          margin: EdgeInsets.only(
                            left: 210,
                          ),
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(0, 182, 88, 88),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color.fromARGB(255, 131, 131, 131),
                            ),
                          ),
                          child: MaterialButton(
                            child: Text(
                              'Simpan',
                              style: GoogleFonts.secularOne(
                                textStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            onPressed: () => controller.ubahdata(
                                controller.namaC.text,
                                controller.asalC.text,
                                controller.suhuC.text,
                                Get.arguments['dataid']),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
