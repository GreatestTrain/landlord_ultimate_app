import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Logger {
  // attributes
  String loginAPI = "";
  String signinAPI = "";

  HttpClient client = HttpClient();

  // methods
  Logger(this.loginAPI, [this.signinAPI = ""]);

  Future<http.Response> login(String username, String password) async {
    var data = {
      'username': username,
      'password': password,
      'residence': '1',
      'signIn': 'singIn'
    };

    return http.post(
      Uri.parse(loginAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  Future<http.Response> signin(
      String username, String email, String password) async {
    var data = {
      'username': username,
      'password': password,
      'residence': '1',
      'signIn': 'singIn'
    };

    return http.post(
      Uri.parse(signinAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }
}

Future<void> main(List<String> args) async {
  const String loginAPI = "http://control.uclubperu.com/index.php";
  var logger = Logger(loginAPI);
  var username = "admin";
  var password = "199733742527";
  http.Response response = await logger.login(username, password);
  print(response.statusCode);
}
