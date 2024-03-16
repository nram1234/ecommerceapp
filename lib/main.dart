import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'presentation/pages/binding/home_binding.dart';
import 'presentation/pages/home_screen.dart';

void main() {
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

        // GetPage(
        //     name: "/LoginScreen",
        //     page: () => const AuthScreen(),
        //     binding: AuthBinding(),
        //     middlewares: [AuthMiddleWare()]),
        GetPage(
          name: "/",
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        ),
        // GetPage(
        //   name: "/DetailsScreen",
        //   page: () => DetailsScreen(),
        //   binding: DetailesBinding(),
        // ),

      ],
    );
  }
}
