
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(    AuthController(), permanent: true) ;

    if (FirebaseAuth.instance.currentUser != null) {

    Get.offAllNamed("/HomeScreen");

    }
  }
}
