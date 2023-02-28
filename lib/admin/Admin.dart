import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';
import '../admin/permintaan/permintaan.dart';
import '../admin/admin_riwayat/ad_riwayat.dart';
import '../navbar/navbar.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(0, 78, 2, 2),
    ));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: NavBar(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 188, 251, 255),
            title: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 80),
                  child: Text(
                    'Enjoy.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  child: Text(
                    'ID',
                    style: TextStyle(
                      color: Color.fromARGB(255, 226, 147, 0),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Permintaan',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: Text(
                    'Riwayat',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          body: TabBarView(
            children: [PermintaanPage(), AdminRiwayatPage()],
          )),
    );
  }
}
