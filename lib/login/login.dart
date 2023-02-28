import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../registrasi/registrasi_controler.dart';
import '../routes/app_pages.dart';
import 'package:flutter_svg/svg.dart';
import '../login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  String? selectedValue;
  bool showPassword = false;
  int _selectedItemIndex = 0;

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
              height: 240,
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
              child: Image.asset(
                'assets/logoapp.png',
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14)),
                ),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 34,
                      width: 20,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 32,
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
                          hintText: "E-mail",
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
                      width: 32,
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
                      child: Obx(
                        () => TextField(
                          // style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                          maxLines: 1,
                          controller: controller.passC,
                          obscureText: controller.obsecureText.value,
                          decoration: InputDecoration(
                            hintText: "Kata Sandi",
                            border: InputBorder.none,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 230,
                    ),
                    Obx(
                      () => Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(
                          top: 4,
                        ),
                        height: 38,
                        width: 315,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 17, 230, 24)),
                          onPressed: () async {
                            if (controller.isLoading.isFalse) {
                              await controller.login();
                            }
                          },
                          child: Text(
                            (controller.isLoading.isFalse)
                                ? 'Login'
                                : 'Loading...',
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
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.login();
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 45, bottom: 20),
                            child: Text(
                              "Belum Memiliki Akun ?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () => Get.toNamed(Routes.REGISTRATION),
                              child: Text(
                                'Registrasi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 132, 192),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 20, right: 20),
                          //   height: 38,
                          //   width: 315,
                          //   decoration: BoxDecoration(
                          //       color: Color.fromARGB(255, 252, 77, 77),
                          //       borderRadius: BorderRadius.circular(3)),
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       primary: Colors.red.shade400,
                          //     ),
                          //     onPressed: () => Get.toNamed(Routes.REGISTRATION),
                          //     child: Text(
                          //       'Registrasi',
                          //       textAlign: TextAlign.center,
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 25,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
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
