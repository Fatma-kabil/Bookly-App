import 'package:bookly_app/conatants.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
