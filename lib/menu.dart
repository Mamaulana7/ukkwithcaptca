import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../pengunjung/data/baru.dart';
import '../pengunjung/riwayat/riwayat.dart';

import 'navbar.dart';



class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final User = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: NavBar(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 188, 251, 255),
            title: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 60),
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
            bottom: TabBar(tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Riwayat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                    'Baru',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          body: TabBarView(
            children: [RiwayatPage(), BaruPage()],
          )),
    );
  }
}
