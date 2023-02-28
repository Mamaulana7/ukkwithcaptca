import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/edit_pengaturan/edit_controller.dart';

import '../widget/app_color.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

final controller = Get.find<EditController>();

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_left, size: 40),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.editdata(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var getdata = snapshot.data!.data() as Map<String, dynamic>;
              controller.namaC.text = getdata["username"];
              controller.emailC.text = getdata["email"];
              controller.passC.text = getdata["password"];
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
                            controller: controller.emailC,
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
                            controller: controller.namaC,
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
                            controller: controller.passC,
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
                                controller.passC.text,
                                controller.emailC.text,
                                Get.arguments),
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
