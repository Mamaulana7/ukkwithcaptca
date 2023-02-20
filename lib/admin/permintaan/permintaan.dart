import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/admin/permintaan/admin_controller.dart';
import '/admin/permintaan/admin_binding.dart';

class PermintaanPage extends StatefulWidget {
  const PermintaanPage({super.key});

  @override
  State<PermintaanPage> createState() => _PermintaanPageState();
}

class _PermintaanPageState extends State<PermintaanPage> {
  TextEditingController _namaC = TextEditingController();
  TextEditingController _dataC = TextEditingController();
  TextEditingController _suhuC = TextEditingController();

  final controller = Get.find<AdminPermintaanController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 18),
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Urutkan Tanggal",
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
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
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.Permintaan(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var admindata = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: admindata.length,
                      itemBuilder: (context, index) => Container(
                        margin:
                            EdgeInsets.only(left: 22, right: 20, bottom: 15),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 180, 255, 249),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 160,
                        width: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              padding: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 168, 82, 82),
                              ),
                              width: 330,
                              height: 30,
                              child: Text(
                                '${(admindata[index].data() as Map<String, dynamic>)["date"]}',
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Text(
                                'Nama: ${(admindata[index].data() as Map<String, dynamic>)["Nama"]}',
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Text(
                                'Dari: ${(admindata[index].data() as Map<String, dynamic>)["Dari"]}',
                                style: GoogleFonts.secularOne(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 5, 5, 5),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Suhu: ${(admindata[index].data() as Map<String, dynamic>)["Suhu"]}',
                                    style: GoogleFonts.secularOne(
                                      textStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 160, 89, 89),
                              ),
                              child: Row(
                                children: [
                                  Obx(
                                    () => Container(
                                      margin: EdgeInsets.only(left: 20),
                                      width: 190,
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                253, 20, 161, 243)),
                                        onPressed: () {
                                          if (controller.isLoading.isFalse) {
                                            controller.tolak();
                                          }
                                        },
                                        child: Text(
                                          (controller.isLoading.isFalse)
                                              ? 'Terima'
                                              : 'Loading...',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Obx(
                                    () => ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(left: 5),
                                          primary: Color.fromARGB(
                                              253, 20, 161, 243)),
                                      onPressed: () {
                                        if (controller.isLoading.isFalse) {
                                          controller.terima();
                                        }
                                      },
                                      child: Text(
                                        (controller.isLoading.isFalse)
                                            ? 'Tolak'
                                            : 'Loading...',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 16,
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child:
                        CircularProgressIndicator(color: Colors.blue.shade400),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Text(
//                                         'Terima',
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.secularOne(
//                                           textStyle: TextStyle(
//                                             color:
//                                                 Color.fromARGB(255, 17, 179, 2),
//                                             fontSize: 17,
//                                           ),
//                                         ),
//                                       ),