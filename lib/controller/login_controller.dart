// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<GlobalKey<FormState>> formKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  // var formKey = GlobalKey<FormState>();
  // var formKeyForgot = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isError = false.obs;
  var pathLoginAsset = "";
  var txtError = "".obs;
  TextEditingController? txtUser = TextEditingController();
  TextEditingController? txtPass = TextEditingController();
  TextEditingController? txtPassDialog = TextEditingController();
  // var session = SessionManager();

  @override
  void onInit() {
    super.onInit();
    // checkHasLogin();
    // print(Config.serverApiUrl);
  }

  @override
  void onReady() {
    super.onReady();
    // fetchLoginImages();
  }

  // void fetchLoginImages() async {
  //   try {
  //     LoginPathImages result =
  //         LoginPathImages.fromJson(await ApiService.getAssetsLogin());
  //     if (result.status!) {
  //       pathLoginAsset = result.path ?? Global.pathLoginImages;
  //     } else {
  //       pathLoginAsset = Global.pathLoginImages;
  //     }
  //   } catch (e) {
  //     print(e);
  //     pathLoginAsset = Global.pathLoginImages;
  //   }
  //   update(['login-page']);
  // }

  // void checkHasLogin() async {
  //   String? id = await session.getIdFromSession();
  //   if (id != "") {
  //     Get.offAllNamed(NavigationView.route);
  //   }
  // }

  // void forgotPasswordPressed() {
  //   if (formKey[1].currentState!.validate()) {
  //     forgotPassword(txtPassDialog!.text);
  //   } else {
  //     print("tidak valid");
  //   }
  //   Get.back();
  //   txtPassDialog?.clear();
  //   update(['login-page']);
  // }

  // forgotPassword(String telp) async {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   EasyLoading.show();
  //   try {
  //     GlobalResponse? globalResponse;
  //     await ApiService.forgotPass(telp)
  //         .then((value) => {globalResponse = GlobalResponse.fromJson(value)});
  //     if (globalResponse != null) {
  //       if (!globalResponse!.error!) {
  //         Util.showSuccessButton(
  //             Get.context!, "Sukses", globalResponse!.message!, () => () {});
  //         txtPassDialog?.clear();
  //       } else {
  //         Util.showInfo(Get.context!, "Perhatian", globalResponse!.message!);
  //       }
  //     } else {
  //       Util.showInfo(Get.context!, "Perhatian", globalResponse!.message!);
  //     }
  //   } on DioError catch (e) {
  //     Util.showInfo(Get.context!, "Perhatian", e.toString());
  //   }
  //   EasyLoading.dismiss();
  //   update(['login-page']);
  // }

  // void loginPressed() async {
  //   EasyLoading.show(status: "Mohon Tunggu ... ");
  //   if (formKey[0].currentState!.validate()) {
  //     var token = await session.generateToken();
  //     if (token != "") {
  //       login(txtUser!.text, txtPass!.text, token);
  //     } else {
  //       EasyLoading.dismiss();
  //       Util.showInfo(Get.context!, "Perhatian", "Gagal Mendapatkan Token");
  //     }
  //   } else {
  //     print("tidak valid");
  //     EasyLoading.dismiss();
  //   }
  //   update(['login-page']);
  // }

  // login(String telp, String pass, String token) async {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   isLoading.value = true;
  //   try {
  //     AuthResponse? authResponse;
  //     await ApiService.signin(telp, pass, token).then((value) {
  //       authResponse = AuthResponse.fromJson(value);
  //       session.destroyAuthToken();
  //       if (authResponse != null) {
  //         if (!authResponse!.error!) {
  //           UserItem item = authResponse!.userItems![0];
  //           session.setSession(item);
  //           Get.offAllNamed(NavigationView.route);
  //         } else {
  //           Util.showInfo(
  //               Get.context!, "alert_text".tr, authResponse!.message!);
  //         }
  //       } else {
  //         isError.value = true;
  //         txtError.value = authResponse!.message!;
  //         Util.showInfo(Get.context!, "alert_text".tr, authResponse!.message!);
  //       }
  //     });
  //     isError.value = false;
  //     isLoading.value = false;
  //   } on DioError catch (e) {
  //     isError.value = true;
  //     txtError.value = e.message;
  //     Util.showInfo(Get.context!, "alert_text".tr, txtError.value);
  //   }
  //   EasyLoading.dismiss();
  //   update(['login-page']);
  // }
}
