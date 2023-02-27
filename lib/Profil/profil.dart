import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Profil/profil_controller.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

final controller = Get.find<ProfilController>();

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PENGATURAN'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_left, size: 40),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.dapatkanData(Get.arguments['id']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var getdata = snapshot.data!.data() as Map<String, dynamic>;
              controller.emailC.text = getdata["email"];
              controller.passwordC.text = getdata["password"];
              controller.usernameC.text = getdata["username"];
              return Container(
                width: 450,
                height: 790,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.person,
                                size: 40,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 25),
                              width: 220,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 155),
                                    child: Text(
                                      'Personal Info',
                                      style: GoogleFonts
                                          .notoSansCanadianAboriginal(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.grey.shade500),
                                    ),
                                  ),
                                  Container(
                                    child: Text('${getdata['username']}'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 94,
                            ),
                            Container(
                              child: Icon(
                                Icons.edit,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.output,
                            size: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              backgroundColor: Colors.white,
                              title: "Ingin Keluar",
                              middleText: "Apakah anda yakin ?",
                              onConfirm: () async {
                                Navigator.pushNamed(context, '/login');
                              },
                              textConfirm: "Iya",
                              textCancel: "Tidak",
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            width: 225,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 115),
                                  child: Text(
                                    'Logout',
                                    style:
                                        GoogleFonts.notoSansCanadianAboriginal(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.grey.shade500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
