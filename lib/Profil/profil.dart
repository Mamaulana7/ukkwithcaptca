import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:kantin/routes/app_pages.dart';
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
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.pengaturandata(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.done:
                Map<String, dynamic> getdata = snapshot.data!.data()!;
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
                                padding: EdgeInsets.only(left: 20, top: 20),
                                width: 230,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 100),
                                      child: Text(
                                        'Personal Info',
                                        style: GoogleFonts
                                            .notoSansCanadianAboriginal(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.grey.shade500),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: 60,
                                      ),
                                      child: GestureDetector(
                                        onTap: () => Get.toNamed(
                                            Routes.EDIT_PENGATURAN,
                                            arguments: getdata['id']),
                                        child: Text(
                                          '${getdata['username']}',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      ),
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
                                      style: GoogleFonts
                                          .notoSansCanadianAboriginal(
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
