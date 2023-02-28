import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pengunjung/riwayat/filter.dart';
import '/pengunjung/riwayat/riwaya_binding.dart';
import '/pengunjung/riwayat/riwayat_controller.dart';
import '/pengunjung/ubah/ubah.dart';
import '/routes/app_pages.dart';
import '../riwayat/filter.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  TextEditingController _namaC = TextEditingController();
  TextEditingController _dataC = TextEditingController();
  TextEditingController _suhuC = TextEditingController();

  final controller = Get.find<RiwayatController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUserData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              Map<String, dynamic> user = snapshot.data!.data()!;
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: StreamBuilder<
                                QuerySnapshot<Map<String, dynamic>>>(
                            stream: controller.StreamData(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(
                                      child: CircularProgressIndicator());
                                case ConnectionState.active:
                                case ConnectionState.done:
                                  List<
                                          QueryDocumentSnapshot<
                                              Map<String, dynamic>>>
                                      listHistory = snapshot.data!.docs;

                                  return listHistory.length > 0
                                      ? ListView.separated(
                                          itemCount: listHistory.length,
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          separatorBuilder: (context, index) =>
                                              SizedBox(height: 16),
                                          itemBuilder: (context, index) {
                                            Map<String, dynamic> presenceData =
                                                listHistory[index].data();

                                            return user['role'] == "Pengunjung"
                                                ? riwayatstatus(
                                                    riwayatstat: presenceData)
                                                : SizedBox();
                                          },
                                        )
                                      : Container(
                                          child: Center(
                                            child: Text(
                                                "Data history masih belum ada"),
                                          ),
                                        );
                                default:
                                  return SizedBox();
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              );
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return Center(child: Text("Error"));
          }
        });
  }
}


//  SizedBox(
//                               height: 2,
//                             ),
//                             Container(
//                               height: 40,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Color.fromARGB(0, 231, 97, 97),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         color: Color.fromARGB(0, 255, 193, 7)),
//                                     width: 200,
//                                     margin: EdgeInsets.only(left: 20),
//                                     child: TextButton(
//                                       onPressed: () => Get.toNamed(Routes.UBAH,
//                                           arguments: carddata[index].id),
//                                       child: Text(
//                                         'ubah',
//                                         style: GoogleFonts.secularOne(
//                                           textStyle: TextStyle(
//                                             color: Color.fromARGB(
//                                                 255, 46, 247, 63),
//                                             fontSize: 17,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 2,
//                                   ),
//                                   Container(),
//                                   SizedBox(
//                                     width: 1,
//                                   ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       color: Color.fromARGB(0, 255, 193, 7)),
                                  //   width: 200,
                                  //   margin: EdgeInsets.only(left: 23),
                                  //   child: TextButton(
                                  //     onPressed: () {
                                  //       controller
                                  //           .deleteData(carddata[index].id);
                                  //     },
                                  //     child: Text(
                                  //       'Hapus',
                                  //       style: GoogleFonts.secularOne(
                                  //         textStyle: TextStyle(
                                  //           color: Colors.red,
                                  //           fontSize: 17,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
//                                 ],
//                               ),
//                             ),