import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login/login.dart';
import 'package:date_field/date_field.dart';
import 'package:get/get.dart';
import '../registrasi/registrasi_controler.dart';
import 'package:image_picker/image_picker.dart';
import '../login/login_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }

  DateTime? selectedDate;
  bool showPassword = false;
  int _selectedItemIndex = 0;

  final controller = Get.find<RegistrationController>();

  final List<String> items = [
    'Admin',
    'Pengunjung',
  ].obs;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromARGB(255, 85, 179, 255),
              Color.fromARGB(255, 103, 255, 204),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70),
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color.fromARGB(255, 85, 179, 255),
                    Color.fromARGB(255, 103, 255, 204),
                  ],
                ),
              ),
              child: Text(
                "OTO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 45,
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14)),
                ),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 34,
                      width: 10,
                      color: Color.fromARGB(0, 3, 3, 3),
                      child: Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          image != null
                              ? Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(209, 151, 165, 177),
                                    borderRadius: BorderRadius.circular(120),
                                    image: new DecorationImage(
                                      image: new FileImage(image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(),
                          TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 85, 85),
                              ),
                              onPressed: (() async {
                                await getImage();
                              }),
                              child: Text(
                                'Pilih foto',
                                style: GoogleFonts.secularOne(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 312,
                      height: 44,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0.1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: controller.emailC,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 312,
                      height: 44,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0.1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: controller.nameC,
                        decoration: InputDecoration(
                          hintText: "Nama Lengkap Anda",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 312,
                      height: 44,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0.1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Obx(() => TextField(
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'poppins'),
                            maxLines: 1,
                            controller: controller.passC,
                            obscureText: controller.obsecureText.value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Kata Sandi",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: (controller.obsecureText != false)
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  controller.obsecureText.value =
                                      !(controller.obsecureText.value);
                                },
                              ),
                              // hintStyle: TextStyle(
                              //   fontSize: 14,
                              //   fontFamily: 'poppins',
                              //   fontWeight: FontWeight.w500,
                              // ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(left: 5),
                        width: 310,
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2,
                                offset: Offset(2, 2),
                                spreadRadius: 0.1,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'Saya Adalah',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 194, 20, 20),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (controller.isLoading.isFalse) {
                                controller.selectedValue = value as String?;
                              }
                            },
                            value: controller.selectedValue,
                            buttonHeight: 40,
                            buttonWidth: 140,
                            itemHeight: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Obx(
                      () => Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 30),
                        padding: EdgeInsets.only(
                          top: 4,
                        ),
                        height: 38,
                        width: 314,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(0, 252, 77, 77),
                            borderRadius: BorderRadius.circular(3)),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (controller.isLoading.isFalse) {
                              await controller.registration();
                            }
                          },
                          child: Text(
                            (controller.isLoading.isFalse)
                                ? 'Registrasi'
                                : 'Loading..',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
