import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kantin/edit_pengaturan/edit_controller.dart';
import 'package:kantin/widget/toast/custom_input.dart';

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
        actions: [
          Obx(
            () => TextButton(
              onPressed: () {
                if (controller.isLoading.isFalse) {
                  controller.ubahdata(
                      controller.namaC.text,
                      controller.emailC.text,
                      controller.passC.text,
                      Get.arguments);
                }
              },
              child: Text(
                  (controller.isLoading.isFalse) ? 'Selesai' : 'Loading...'),
              style: TextButton.styleFrom(
                primary: AppColor.primaryExtraSoft,
              ),
            ),
          ),
        ],
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
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(20),
                children: [
                  Center(
                    child: Stack(
                      children: [
                        GetBuilder<EditController>(
                          builder: (controller) {
                            if (controller.image != null) {
                              return ClipOval(
                                child: Container(
                                  width: 98,
                                  height: 98,
                                  color: AppColor.primaryExtraSoft,
                                  child: Image.file(
                                    File(controller.image!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            } else {
                              return ClipOval(
                                child: Container(
                                  width: 98,
                                  height: 98,
                                  color: AppColor.primaryExtraSoft,
                                  child: Image.network(
                                    (getdata["avatar"] == null ||
                                            getdata['avatar'] == "")
                                        ? "https://ui-avatars.com/api/?name=${getdata['name']}/"
                                        : getdata['avatar'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            width: 36,
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.pickImage();
                              },
                              child: Icon(Icons.camera_alt),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                backgroundColor: AppColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // user - data
                  CustomInput(
                      controller: controller.emailC,
                      label: 'Email anda',
                      hint: 'Email'),
                  CustomInput(
                      controller: controller.namaC,
                      label: 'Nama lengkap',
                      hint: 'Nama'),
                  CustomInput(
                      controller: controller.passC,
                      label: 'Password',
                      hint: 'Password'),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

// Container(
//                     margin: EdgeInsets.only(top: 20),
//                     child: Column(
//                       children: [
//                         Container(

//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                             top: 10,
//                           ),
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(
//                                   color: Color.fromARGB(255, 131, 131, 131))),
//                           width: 370,
//                           height: 45,
//                           child: TextField(
//                             controller: controller.emailC,
//                             textAlign: TextAlign.left,
//                             decoration: InputDecoration(
//                               hintText: "Nama",
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                             top: 15,
//                           ),
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(
//                                   color: Color.fromARGB(255, 131, 131, 131))),
//                           width: 370,
//                           height: 45,
//                           child: TextField(
//                             controller: controller.namaC,
//                             textAlign: TextAlign.left,
//                             decoration: InputDecoration(
//                               hintText: "Dari",
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                             top: 15,
//                           ),
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(
//                                   color: Color.fromARGB(255, 131, 131, 131))),
//                           width: 370,
//                           height: 45,
//                           child: TextField(
//                             controller: controller.passC,
//                             textAlign: TextAlign.left,
//                             decoration: InputDecoration(
//                               hintText: "Suhu",
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
