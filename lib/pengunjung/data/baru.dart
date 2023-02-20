import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '/pengunjung/data/baru_controller.dart';

class BaruPage extends StatefulWidget {
  const BaruPage({super.key});

  @override
  State<BaruPage> createState() => _BaruPageState();
}

class _BaruPageState extends State<BaruPage> {
  final controller = Get.find<BaruController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 35,
      ),
      child: Column(
        children: [
          Container(
            width: 370,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 245, 204),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal Hari Ini',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  '${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now())}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
              ],
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
                border: Border.all(color: Color.fromARGB(255, 131, 131, 131))),
            width: 370,
            height: 45,
            child: TextField(
              controller: controller.namaC,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "Nama Lengkap",
                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                border: Border.all(color: Color.fromARGB(255, 131, 131, 131))),
            width: 370,
            height: 45,
            child: TextField(
              controller: controller.asalC,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "Dari Manakah Anda ?",
                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                border: Border.all(color: Color.fromARGB(255, 131, 131, 131))),
            width: 370,
            height: 45,
            child: TextField(
              controller: controller.suhuC,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[00-30]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                hintText: "Suhu Tubuh ?",
                border: OutlineInputBorder(borderSide: BorderSide.none),
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
                onPressed: () {
                  controller.tambahdata();
                },
              )),
        ],
      ),
    );
  }
}
