
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_controller/home_controller.dart';

class AuthController extends GetxController with GetTickerProviderStateMixin {
  bool isLogin = false;
  bool isRegister = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late PageController pageController;
  final formLogInKey = GlobalKey<FormState>();
  final formSignUpKey = GlobalKey<FormState>();
  final formRestPassWordKey = GlobalKey<FormState>();

  String? lang;

  registerUser(context) async {
    isRegister = true;
    update();
    try {
      // UserCredential cred =
      await firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => Navigator.of(context).pop());
    } catch (e) {
      Get.snackbar(
        'errorcreatingaccount'.tr,
        e.toString(),
      );
    }

    isRegister = false;
    update();
  }

  void loginUser({required context}) async {
    isLogin = true;
    update();
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {

        Navigator.pop(context);
      });
    } catch (e) {
      Get.snackbar(
        'Logging Error',
        "loginerr".tr,
      );
    }
    isLogin = false;
    update();
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    pageController.dispose();

    super.dispose();
  }



}
