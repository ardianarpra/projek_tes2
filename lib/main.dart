import 'package:diskominfo/common/colors.dart';
import 'package:diskominfo/page/splash/splash_view.dart';
import 'package:diskominfo/router/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aduan Kominfo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme:ThemeData(
              textTheme: ThemeData.light().textTheme.copyWith(),
              primarySwatch: AppColors.primaryAccentColorBiji)
          // textTheme: GoogleFonts.interTextTheme())
          .copyWith(
              pageTransitionsTheme: const PageTransitionsTheme(
                  builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder()
          })),
          home:GestureDetector(
            onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
            child: const SplashPage(),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteApp.initial,
          getPages: RouteApp.routes,
    );
  }
}

