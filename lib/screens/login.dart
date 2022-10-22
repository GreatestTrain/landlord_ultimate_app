import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'home.dart';
import 'dart:convert';
import 'package:http/http.dart';

void main(List<String> args) {
  runApp(LoginScreen());
}

const String api = "https://control.uclubperu.com/index.php?signIn=1";

const String titleLoginScreen = "Iniciar sesión";

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginPage> {
  String errormsg;
  bool error, progress;
  String username, password;

  var _username = TextEditingController();
  var _password = TextEditingController();

  startLogin() async {
    String api_url = api;
    print(username);

    var response = await https.post(Uri.parse(api_url),
        body: {'username': username, 'password': password});
  }

  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body)
    if (jsondata["error"]) {
      setState(() {
        progress = false;
        error = true;
        errormsg = jsondata["message"];
      });
    } else {
      progress = false;
      error = true;
      errormsg = "Algo salió mal :c."
    }
  }
}
