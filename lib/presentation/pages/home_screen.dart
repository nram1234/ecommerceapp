import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller/home_controller.dart';

//import 'package:ionicons/ionicons.dart';
class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked : (didPop){

      },
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: GetBuilder<HomeController>(builder: (logic) {
            return Column(
              children: [


              ],
            );
          }),bottomNavigationBar: BottomNavigationBar(items: const [ BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),],onTap: (int i){},),
        ),
      ),
    );
  }
}
