import 'package:flutter/material.dart';
// import 'dart:ui';

/* void main(List<String> args) {
  runApp(const HomeApp());
} */

var homeTitle = 'this is a title';
const String label1 = 'label1';
const String label2 = 'label2';

/* var dictionary = Map.of(
  "homeTitle" to "This is a title",
  "anotherTitle" to "Another title",
); */

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: homeTitle,
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            homeTitle,
            style: const TextStyle(
                color: Colors.black, fontStyle: FontStyle.italic, fontSize: 25),
          ),
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: label1),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: label2)
        ]),
      ),
    );
  }
}
