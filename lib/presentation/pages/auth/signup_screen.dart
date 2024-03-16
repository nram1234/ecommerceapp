import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import 'controller/auth_controller.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (logic) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(key: logic.formSignUpKey,
            child: Column(children: [
              SizedBox(
                height: size.height * .2,
              ),
              CustomTextfield(
                  textEditingController: logic.emailController,
                  labelText: "email".tr,
                  color: Colors.white,
                  radius: 20,labelColor:Colors.white ,
                  textInputType: TextInputType.emailAddress,
                  ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                  textEditingController: logic.passwordController,
                  labelText: "password".tr,
                  obscureText: true,
                  color: Colors.white,
                  radius: 20,labelColor:Colors.white ,
              ),
              const SizedBox(
                height: 20,
              ),

           logic.isRegister?const SizedBox(
             height: 40,
             width: 40,
             child: CircularProgressIndicator(),
           ):   CustomButton(
                onClick: () {
                if(logic.formSignUpKey.currentState!.validate()){
                  logic.registerUser(context);
                }
                },
                title: 'register',
                buttonColor:Colors.white,
                width: size.width,
                titleColor: Colors.blue,
                height: 50,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                borderRadius: 10,
                colorBoxShadow: Colors.blue,
                blurRadius: 10,
                offset: const Offset(5, 6),
                spreadRadius: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                width: size.width * .6,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "have account",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.pageController.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceOut);
                    },
                    child: Text(
                      "login",
                      style:   TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      );
    });
  }
}
