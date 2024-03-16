import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';
import 'presentation/pages/auth/binding/auth_binding.dart';
import 'presentation/pages/auth/login_screen.dart';
import 'presentation/pages/auth/middleware/auth_middleware.dart';
import 'presentation/pages/binding/home_binding.dart';
import 'presentation/pages/details_screen/detailes_screen.dart';
import 'presentation/pages/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();


  await Future.wait([

    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
   ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      getPages: [

        GetPage(
            name: "/login",
            page: () => const AuthScreen(),
            binding: AuthBinding(),
            middlewares: [AuthMiddleWare()]),
        GetPage(
          name: "/",
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        ),


      ],
    );
  }
}
