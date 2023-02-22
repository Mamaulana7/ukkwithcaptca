import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '/pengunjung/riwayat/riwayat_controller.dart';
import '/pengunjung/ubah/ubah.dart';
import '/routes/app_pages.dart';

class riwayatstatus extends StatelessWidget {
  final Map<String, dynamic> riwayatstat;
  riwayatstatus({required this.riwayatstat});
  final controller = Get.find<RiwayatController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.PERMINTAAN, arguments: riwayatstat),
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(236, 144, 240, 247),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12, top: 10),
                  child: Text(
                    (riwayatstat["Nama"].toString().length < 10)
                        ? "${riwayatstat["Nama"]}"
                        : "${riwayatstat["Nama"].toString().substring(0, 12)}...",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12, top: 10),
                  child: Text(
                    (riwayatstat["date"] == null)
                        ? "-"
                        : "${DateFormat('EEEE dd/MM/yyyy', 'id_ID').format(DateTime.parse(riwayatstat['date']))}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 12, top: 7),
              child: Row(
                children: [
                  Text(
                    "Perjalanan: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    (riwayatstat["Dari"].toString().length < 50)
                        ? "${riwayatstat["Dari"]}"
                        : "${riwayatstat["Dari"].toString().substring(0, 50)}...",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Text(
                    (riwayatstat["status"] == 0)
                        ? "Status : Belum dibaca"
                        : (riwayatstat["status"] == 1)
                            ? "Status : Diterima"
                            : "Status : Ditolak",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 5),
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      controller.deleteData(riwayatstat[Index].dataid);
                    },
                    child: Text(
                      'Hapus',
                      style: GoogleFonts.secularOne(
                        textStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 5),
                  width: 150,
                  child: TextButton(
                    onPressed: () =>
                        Get.toNamed(Routes.UBAH, arguments: riwayatstat),
                    child: Text(
                      'Ubah',
                      style: GoogleFonts.secularOne(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 7, 241, 27),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
