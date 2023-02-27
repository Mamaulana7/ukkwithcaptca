import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'user',
              style: GoogleFonts.roboto(
                fontSize: 25,
              ),
            ),
            accountEmail: Text(
              'Delia@gmail.com',
              style: GoogleFonts.roboto(
                fontSize: 15,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/ayang.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Color.fromARGB(255, 69, 158, 161)),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Pengaturan'),
            onTap: (() {
              Navigator.pushNamed(context, '/profil');
            }),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Lapor'),
            onTap: () => null,
          ),
          Divider(
            color: Colors.grey[600],
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
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
              }),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 260, left: 90),
                color: Color.fromARGB(0, 255, 193, 7),
                child: Icon(Icons.copyright),
              ),
              Container(
                margin: EdgeInsets.only(top: 260),
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 69, 123, 160),
                ),
                height: 30,
                child: Text(
                  'Copyrigth-2023',
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
