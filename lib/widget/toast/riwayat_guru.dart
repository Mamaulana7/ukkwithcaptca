import 'package:flutter/material.dart';
import '/routes/app_pages.dart';
import '/widget/app_color.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/widget/app_color.dart';

class RiwayatTileAdmin extends StatelessWidget {
  final Map<String, dynamic> riwayatData;
  RiwayatTileAdmin({required this.riwayatData});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.RIWAYAT, arguments: riwayatData),
      borderRadius: BorderRadius.circular(8),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: AppColor.primaryExtraSoft,
            ),
          ),
          padding: EdgeInsets.only(left: 24, top: 20, right: 29, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (riwayatData["nama"].toString().length < 10)
                        ? "${riwayatData["nama"]}"
                        : "${riwayatData["nama"].toString().substring(0, 10)}...",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    (riwayatData["date"] == null)
                        ? "-"
                        : "${DateFormat('EEEE dd/MM/yyyy', 'id_ID').format(DateTime.parse(riwayatData['date']))}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                (riwayatData["title"].toString().length < 10)
                    ? "${riwayatData["title"]}"
                    : "${riwayatData["title"].toString().substring(0, 10)}...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                (riwayatData["description"].toString().length < 50)
                    ? "${riwayatData["description"]}"
                    : "${riwayatData["description"].toString().substring(0, 50)}...",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Text(
                    (riwayatData["status"] == 0)
                        ? "Status : Belum dibaca"
                        : (riwayatData["status"] == 1)
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
          )),
    );
  }
}
