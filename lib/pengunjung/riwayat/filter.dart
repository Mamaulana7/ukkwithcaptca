import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/routes/app_pages.dart';

class riwayatstatus extends StatelessWidget {
  final Map<String, dynamic> riwayatstat;
  riwayatstatus({required this.riwayatstat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.PERMINTAAN, arguments: riwayatstat),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (riwayatstat["Nama"].toString().length < 10)
                    ? "${riwayatstat["Nama"]}"
                    : "${riwayatstat["Nama"].toString().substring(0, 10)}...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                (riwayatstat["date"] == null)
                    ? "-"
                    : "${DateFormat('EEEE dd/MM/yyyy', 'id_ID').format(DateTime.parse(riwayatstat['date']))}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            (riwayatstat["Asal"].toString().length < 50)
                ? "${riwayatstat["Asal"]}"
                : "${riwayatstat["Asal"].toString().substring(0, 50)}...",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              Text(
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
            ],
          ),
        ],
      ),
    );
  }
}
