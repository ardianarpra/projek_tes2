import 'dart:async';
import 'dart:io';
import 'package:diskominfo/page/login/login_view.dart';
import 'package:diskominfo/utils/session_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class SplashController extends GetxController {
  var isLoadSplash = true.obs;
  var isConnectServer = false.obs;
  var isMaintenance = false.obs;
  var isHaveNewVersion = false.obs;
  var updateImportant = false.obs;

  @override
  void onInit() {
    super.onInit();
    // initConnectivity();
    changePage();
   
  }

  Future<void> changePage()async{
    var session = SessionManager();
    String token = await session.getAuthToken();
    Future.delayed(const Duration(seconds: 3),(){
      print("ganti halaman oy"+token);
      if(token!=""){
        // Get.offAllNamed(NavigationView.route);
      } else {
        Get.offAllNamed(LoginView.route);
      }
    });
  }

  Future<void> initConnectivity() async {
   
  }
}
