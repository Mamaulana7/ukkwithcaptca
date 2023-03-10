import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/widget/toast/custom_toach.dart';
import '../registrasi/registrasi_controler.dart';
import '../routes/app_pages.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final controller = Get.find<LoginController>();

class _LoginPageState extends State<LoginPage> {
  String? selectedValue;
  bool showPassword = false;
  int _selectedItemIndex = 0;
  bool captcha = false;
  String data = "";

  WebViewPlusController? _webViewController;

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
        child: Stack(
          children: [
            Column(
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: controller.emailC,
                            decoration: InputDecoration(
                              hintText: "E-mail",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(
                            () => TextField(
                              // style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                              maxLines: 1,
                              controller: controller.passC,
                              obscureText: controller.obsecureText.value,
                              decoration: InputDecoration(
                                hintText: "   Kata Sandi",
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
                          height: 18,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: 33,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                captcha = data == '';
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: data == ''
                                    ? Colors.blue[600]
                                    : Colors.blue.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                data == ''
                                    ? !captcha
                                        ? "Get Captcha"
                                        : "Loading...."
                                    : "Captcha Berhasil",
                                style: GoogleFonts.poppins(
                                  color: data == ''
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
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
                                if (controller.isLoading.isFalse &&
                                    data != '') {
                                  await controller.login();
                                  setState(() {
                                    _webViewController?.webViewController
                                        .reload();
                                    data = '';
                                    captcha = false;
                                  });
                                } else {
                                  CustomToast.errorToast(
                                      'Error', 'verifikasi captcha');
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
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 60, bottom: 40),
                              child: Row(
                                children: [
                                  Text(
                                    "Belum Memiliki Akun ?",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.REGISTRATION),
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
                                ],
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
                      ],
                    ),
                  ),
                )
              ],
            ),
            captcha
                ? SafeArea(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: WebViewPlus(
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewPlusController controller) {
                          _webViewController = controller;
                          controller.loadUrl("assets/webpage/index.html");
                        },
                        backgroundColor: Colors.black.withOpacity(0.5),
                        javascriptChannels: <JavascriptChannel>{
                          JavascriptChannel(
                              name: 'Captcha',
                              onMessageReceived: (JavascriptMessage message) {
                                print(message.message);
                                setState(() {
                                  captcha = false;
                                  data = message.message;
                                });
                              }),
                          JavascriptChannel(
                              name: 'Close',
                              onMessageReceived: (JavascriptMessage message) {
                                setState(() {
                                  captcha = false;
                                });
                              }),
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
