
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class AuthMiddleWare extends GetMiddleware {
 // final SecureStorage _secureStorage = SecureStorage();

  @override
  RouteSettings? redirect(String? route) {

    if (FirebaseAuth.instance.currentUser != null) {

      return const RouteSettings(name: "/HomeScreen");

    }
    return null;
  }
}
