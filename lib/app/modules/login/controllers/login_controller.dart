import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/api.dart';
import '../../dashboard/views/dashboard_view.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void loginNow() async { 
    final response = await _getConnect.post(BaseUrl.auth, { 
      'email': emailController.text,
      'password': passwordController.text,
    });

    if (response.body['success'] == true) {
      authToken.write('token', response.body['access_token']);
      Get.offAll(() => DashboardView());
    } else {
      Get.snackbar(
        'Error',
        response.body['message'].toString(),
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        margin: const EdgeInsets.only(
          top: 10,
          left: 5,
          right: 5,
        ),
      );
    }
  }
}
