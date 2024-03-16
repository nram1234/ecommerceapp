import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';


import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../home_controller/home_controller.dart';


class  Profile extends GetView<HomeController> {
  const  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.find<HomeController>().context = context;
    //final box = context.findRenderObject() as RenderBox?;
    return Scaffold(
      body:   GetBuilder<HomeController>(
          id: "profile",
          builder: (logic) {

            return FirebaseAuth.instance.currentUser != null? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      maxRadius: 50,backgroundImage: AssetImage("assets/images/addim.png"),

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(

                      textEditingController:
                      logic.textEditingControllerName,
                      labelText: "name",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(

                      textEditingController:
                      logic.textEditingControllerPhone,
                      labelText: 'phone',
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),


                    logic.addMyStoreData
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : CustomButton(
                        width: double.infinity,
                        buttonColor: Colors.blue.withOpacity(.8),
                        title: 'save'.tr,
                        onClick:(){},
                        height: 60,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        borderRadius: 12,
                        titleColor: Colors.white,
                       ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        width: double.infinity,
                        buttonColor: Colors.blue.withOpacity(.8),
                        title: "logout".tr,
                        onClick: logic.signOut,
                        height: 60,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        borderRadius: 12,
                        titleColor: Colors.white,
                      ),
                    const SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ):Center(child:    CustomButton(
              width: double.infinity,
              buttonColor: Colors.blue.withOpacity(.8),
              title: "login",
              onClick: (){
                Get.toNamed("/login");
              },
              height: 60,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              borderRadius: 12,
              titleColor: Colors.white,
            ),);
          }),
    );
  }
}
