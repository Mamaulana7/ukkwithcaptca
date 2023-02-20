// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import '../widget/app_color.dart';
// import '../widget/toast/custom_input.dart';
// import '../update_profile/update_controller.dart';
// import '../widget/app_color.dart';
// import '../widget/toast/custom_input.dart';

// import '../update_profile/update_controller.dart';

// class UpdateProfileView extends GetView<UpdateProfileController> {
//   final Map<String, dynamic> user = Get.arguments;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Edit Profile',
//           style: TextStyle(
//             color: AppColor.secondary,
//             fontSize: 14,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: Icon(Icons.arrow_left),
//         ),
//         actions: [
//           Obx(
//             () => TextButton(
//               onPressed: () {
//                 if (controller.isLoading.isFalse) {
//                   controller.updateProfile();
//                 }
//               },
//               child:
//                   Text((controller.isLoading.isFalse) ? 'Done' : 'Loading...'),
//               style: TextButton.styleFrom(
//                 primary: AppColor.primary,
//               ),
//             ),
//           ),
//         ],
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//             color: AppColor.secondaryExtraSoft,
//           ),
//         ),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.all(20),
//         children: [
//           // section 1 - Profile Picture
//           Center(
//             child: Stack(
//               children: [
//                 GetBuilder<UpdateProfileController>(
//                   builder: (controller) {
//                     if (controller.image != null) {
//                       return ClipOval(
//                         child: Container(
//                           width: 98,
//                           height: 98,
//                           color: AppColor.primaryExtraSoft,
//                           child: Image.file(
//                             File(controller.image!.path),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     } else {
//                       return ClipOval(
//                         child: Container(
//                           width: 98,
//                           height: 98,
//                           color: AppColor.primaryExtraSoft,
//                           child: Image.network(
//                             (user["avatar"] == null || user['avatar'] == "")
//                                 ? "https://ui-avatars.com/api/?name=${user['name']}/"
//                                 : user['avatar'],
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: SizedBox(
//                     width: 36,
//                     height: 36,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         controller.pickImage();
//                       },
//                       child: Icon(Icons.camera_alt),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           //section 2 - user data
//           CustomInput(
//             controller: controller.nameC,
//             label: "Nama Lengkap",
//             hint: "Nama lengkap anda",
//             margin: EdgeInsets.only(bottom: 16, top: 42),
//           ),
//         ],
//       ),
//     );
//   }
// }
