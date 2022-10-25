import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:landlord_ultimate_app/states/home/buttons.dart';
import 'package:landlord_ultimate_app/states/logging/loggingScreen.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: BodyScreen(),
    );
  }
}

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});
  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    Widget logoutButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoggingPage()));
      },
      child: const Text("Logout"),
    );

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_dash),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt),
            label: 'Departamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.group),
            label: 'Madres solteras',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tickets),
            label: 'Facturación',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Mi perfil',
          )
        ]),
        tabBuilder: (context, index) => logoutButton);
  }
}
