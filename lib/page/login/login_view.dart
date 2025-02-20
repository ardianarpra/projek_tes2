import 'dart:async';
import 'package:diskominfo/common/colors.dart';
import 'package:diskominfo/components/button.dart';
import 'package:diskominfo/components/input_text.dart';
import 'package:diskominfo/components/input_text_password.dart';
import 'package:diskominfo/controller/login_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  static const route = "/login-page";

  bool isShow = true;
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        id: "login-page",
        dispose: (state) => Get.delete<LoginController>(),
        builder: (controller) => AnnotatedRegion(
              value: SystemUiOverlayStyle(
                statusBarColor: AppColors.primary,
              ),
              child: Scaffold(
                backgroundColor: AppColors.grey200,
                key: controller.scaffoldKey,
                body: SafeArea(
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: Get.height / 4.5,),
                                // Image.asset(
                                //   "assets/drawable/login_uliz.png",
                                //   fit: BoxFit.cover,
                                // ),s
                              Image.network("https://kelurahantanjungbenoa.badungkab.go.id/storage/kelurahantanjungbenoa/image/PEMKAB%20BADUNG.png",scale: 7.6,),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20),
                                margin:const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                color: AppColors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  children: [
                                    formBody(controller),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    footer(controller, context),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget formBody(LoginController controller) {
    return SizedBox(
      // padding: padding,
      child: Form(
        key: controller.formKey[0],
        child: Column(
          children: [
            InputText(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onchanged: (val) {
                if (_debounce?.isActive == false) _debounce?.cancel();
                _debounce = Timer(const Duration(seconds: 1), () {
                  controller.formKey[0].currentState?.validate();
                });
              },
              // validator: validateNumber,
              controller: controller.txtUser,
              padding: const EdgeInsets.only(left: 16, right: 16),
              title: "NIK / Username",
              hint: "",
            ),
            const SizedBox(
              height: 20,
            ),
            InputTextPassword(
              textInputAction: TextInputAction.done,
              onchanged: (val) {
                if (_debounce?.isActive == false) _debounce?.cancel();
                _debounce = Timer(const Duration(seconds: 1), () {
                  controller.formKey[0].currentState?.validate();
                });
              },
              // validator: validatePassword,
              controller: controller.txtPass,
              padding: const EdgeInsets.only(left: 16, right: 16),
              title: "Password",
              hint: "*****",
              secure: isShow,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget footer(controller, context) {
    return Container(
      child: Column(
        children: [
          Button(
            heigth: 40,
            onPressed: (){},
            colors: AppColors.primary,
            textColors: AppColors.white,
            name: "Login",
            padding: const EdgeInsets.only(left: 16, right: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
             
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric( horizontal: 16),
              child: Text(
                "Lupa Password?",
                style: TextStyle(color: AppColors.primary, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
