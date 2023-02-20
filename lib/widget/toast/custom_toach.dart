import 'package:flutter/material.dart';
import '../app_color.dart';
import 'package:get/get.dart';

class CustomToast {
  static errorToast(String? title, String? message) {
    Get.rawSnackbar(
      duration: Duration(seconds: 4),
      dismissDirection: DismissDirection.horizontal,
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    title ?? "error",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
                Text(
                  message ?? "Add your error message here",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.error,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 16),
      borderRadius: 8,
      snackPosition: SnackPosition.TOP,
    );
  }

  static successToast(String? title, String? message) {
    Get.rawSnackbar(
      duration: Duration(seconds: 4),
      dismissDirection: DismissDirection.horizontal,
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    title ?? "Success",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
                Text(
                  message ?? "Add your success message here",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.success,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 16),
      borderRadius: 8,
      snackPosition: SnackPosition.TOP,
    );
  }
}
