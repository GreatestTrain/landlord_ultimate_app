import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
import 'package:landlord_ultimate_app/login/log.dart';
import 'package:landlord_ultimate_app/screens/home/screen.dart';
// Elements of the home screen
// customizible vars are prefixed by _

String loginAPI = "https://control.uclubperu.com/index.php?signIn=1";

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
Logger logger = Logger(loginAPI);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Container headerContainer = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text('A title, a logo maybe?'));

    Container titleContainer = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Sign in',
          style: TextStyle(fontSize: 20),
        ));

    Container usernameContainer = Container(
      padding: const EdgeInsets.all(1),
      child: CupertinoTextField(
        controller: usernameController,
        placeholder: 'Required',
        prefix: const Text(
          'Username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: const BoxDecoration(),
      ),
    );

    Container passwordContainer = Container(
        padding: const EdgeInsets.all(1),
        child: CupertinoTextField(
          obscureText: true, // dont wanna them to know it uh?
          controller: passwordController,
          placeholder: "Required",
          prefix: const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: const BoxDecoration(),
        ));
    Container usernamePasswordContainer = Container(
      padding: const EdgeInsets.all(16),
      // height: 200,
      // width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Column(
        children: <Widget>[
          usernameContainer,
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          passwordContainer,
        ],
      ),
    );

    TextButton forgotText = TextButton(
      onPressed: () {
        //forgot password redirection
      },
      child: const Text(
        'Forgot Password',
      ),
    );

    Container loginContainer = Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BodyApp()));
          },
        ));

    Row signupButton = Row(
      children: <Widget>[
        const Text('Do not have an account?'),
        TextButton(
          child: const Text('Sign in'),
          onPressed: () {
            //signup redirection
          },
        )
      ],
    );

    Padding body = Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          headerContainer,
          titleContainer,
          // usernameContainer,
          // passwordContainer,
          usernamePasswordContainer,
          forgotText,
          loginContainer,
          signupButton
        ],
      ),
    );

    return body;
  }
}
