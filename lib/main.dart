import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:landlord_ultimate_app/screens/loginScreen.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// const primaryColor = Colors.teal;
const String fontFamily = 'SourceSans3';

// the initial app - login app
class StartApp extends StatelessWidget {
  const StartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        theme: CupertinoThemeData(
            // brightness: Brightness.light,
            textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: fontFamily))),
        home: LoginScreen());
  }
}

// class BodyApp extends StatelessWidget {
//   const BodyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Main",
//       home: const S
//     );
//   }
// }

void main(List<String> args) {
  runApp(const StartApp());
}
