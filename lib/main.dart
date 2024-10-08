import 'package:bookly_app/conatants.dart';
import 'package:bookly_app/core/utils/app_router.dart';

import 'package:flutter/material.dart';

//import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          brightness: Brightness.dark,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      debugShowCheckedModeBanner: false,
    );
  }
}
