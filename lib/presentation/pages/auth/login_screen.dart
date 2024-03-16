
import 'package:ecommerceapp/presentation/pages/auth/signup_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import 'controller/auth_controller.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(bottom: false,
      child: Scaffold(
          backgroundColor: Colors.blue.withOpacity(.4),
          body: Stack(
            children: [
              GetBuilder<AuthController>(builder: (logic) {
                return PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  allowImplicitScrolling: false,
                  controller: logic.pageController,
                  scrollDirection: Axis.vertical,
                  children: const [Login(), SignupScreen() ],
                );
              }),

            ],
          )),
    );
  }
}

class Login extends GetView<AuthController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (logic) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: logic.formLogInKey,
            child: Column(children: [
              SizedBox(
                height: size.height * .2,
              ),
              CustomTextfield(
                  textEditingController: logic.emailController,
                  labelText: "email" ,labelColor:Colors.white ,
                  color: Colors.white,
                  radius: 20,
                  textInputType: TextInputType.emailAddress,
            ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                  textEditingController: logic.passwordController,
                  labelText: "password",labelColor:Colors.white ,
                  obscureText: true,
                  color: Colors.white,
                  radius: 20,
                  ),
              const SizedBox(
                height: 20,
              ),
              logic.isLogin
                  ? const SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      onClick: () {
                        if (logic.formLogInKey.currentState!.validate()) {
                          logic.loginUser(context: context);
                        }
                      },
                      title: 'login',
                      buttonColor: Colors.blue,
                      width: size.width,
                      titleColor: Colors.white,
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

                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceIn);
                    },
                    child: Text(
                      "register" ,
                      style: TextStyle(
                          color: Colors.white,
                         // backgroundColor: Colors.white.withOpacity(.5),
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

//
//
//
//
//
//
// AnimatedBuilder(animation: Listenable.merge([controller.xControllerForSignUp,controller.xControllerForLogin]),
// builder:(context,ch){
// return Center(
// child: Container(height: 300,width: screenwidth*.7,
// child: Stack(children: [
// Container(
// color: Color(0xFF1a1b26),
// ),
// Transform(
// alignment: Alignment.centerLeft,
// transform: Matrix4.identity()
// ..setEntry(3, 2, 0.001)
// ..translate(controller.xControllerForLogin.value )
// ..rotateY(controller.yRotationAnimationForLogin.value),
// child: SignupScreen(),
// ),  Transform(
// alignment: Alignment.centerRight,
// transform: Matrix4.identity()
// ..setEntry(3, 2, 0.001)
// ..translate(  controller.xControllerForLogin.value*screenwidth*.8  )
// ..rotateY(controller.yRotationAnimationForSignUp.value),
// child: Login(),
// ),
// ]),
// ),
// );
// } ,
// ),
