import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landlord_ultimate_app/states/logging/loggingScreen.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// const primaryColor = Colors.teal;
const String fontFamily = 'SourceSans3';

// the initial app - login app
class LandlordApp extends StatelessWidget {
  const LandlordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "quirky landlord jRPG",
      theme: CupertinoThemeData(
          // barBackgroundColor: Colors.blue,
          // brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: fontFamily))),
      home: const LoggingPage(),
    );
  }
}

void main(List<String> args) {
  runApp(const LandlordApp());
}
