
import 'package:diskominfo/common/colors.dart';
import 'package:diskominfo/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const route = "/splash-page";
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Global.sizeWidth = MediaQuery.of(context).size.width;
    // Global.sizeHeight = MediaQuery.of(context).size.height;
    return GetBuilder<SplashController>(
      id: 'splash-page',
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   child: Image.asset(
                  //     Config.pathSplash,
                  //     width: 40,
                  //     height: 40,
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text(
                          "Diskominfo",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        controller.isLoadSplash.value
                            ? const SizedBox()
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controller.isConnectServer.value
                                        ? controller.isMaintenance.value
                                            ? "maintenance".tr
                                            : controller.isHaveNewVersion.value
                                                ? controller
                                                        .updateImportant.value
                                                    ? ""
                                                    : "update_version".tr
                                                : ""
                                        : "failed_connect_server".tr,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        controller.isLoadSplash.value
                            ?const Center(
                                child: SizedBox(
                                  width: 26,
                                  height: 26,
                                  child: CircularProgressIndicator(
                                    color: AppColors.colorAccent,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
              
            ],
          ),
        );
      },
    );
  }
}
