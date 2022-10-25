import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
import 'package:landlord_ultimate_app/states/logging/log.dart';
import 'package:landlord_ultimate_app/states/home/homeScreen.dart';
// Elements of the home screen
// customizible vars are prefixed by _

String loginAPI = "https://control.uclubperu.com/index.php?signIn=1";

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

  void loginFunction(String username, String password) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BodyScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Container headerContainer = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Image.network(
              "https://media.tenor.com/7lR7Bw5AUZcAAAAC/tomboy-anime.gif")
        ]));

    Container titleContainer = Container(
        alignment: Alignment.center,
        width: 150,
        height: 75,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Sign in',
          style: TextStyle(fontSize: 30),
        ));

    Container usernameContainer = Container(
      padding: const EdgeInsets.all(1),
      child: CupertinoTextField(
        controller: usernameController,
        placeholder: 'Dios es gay',
        maxLines: 1,
        placeholderStyle: const TextStyle(color: Colors.black54),
        style: const TextStyle(color: Colors.black),
        prefix: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(CupertinoIcons.person_2),
            VerticalDivider(
              thickness: 0,
            ),
            Text(
              'Username',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(),
      ),
    );

    Container passwordContainer = Container(
        padding: const EdgeInsets.all(1),
        child: CupertinoTextField(
          obscureText: true, // dont wanna them to know it uh?
          controller: passwordController,
          style: const TextStyle(color: Colors.black),
          placeholder: "Required",
          placeholderStyle: const TextStyle(color: Colors.black54),
          maxLines: 1,
          onSubmitted: (String value) =>
              loginFunction(usernameController.text, value),
          prefix: Row(
            mainAxisSize: MainAxisSize.max,
            children: const <Widget>[
              Icon(CupertinoIcons.number_circle),
              VerticalDivider(
                thickness: 0,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          decoration: const BoxDecoration(),
        ));
    Container usernamePasswordContainer = Container(
      padding: const EdgeInsets.all(16),
      // height: 200,
      width: 400,
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

    Row forgotText = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Password issue?'),
        CupertinoButton(
            child: const Text("here"),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const ForgotScreen()),
              );
            })
      ],
    );

    Container loginContainer = Container(
        height: 50,
        width: 200,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: CupertinoButton.filled(
          child: const Text('Login',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          onPressed: () =>
              loginFunction(usernameController.text, passwordController.text),
        ));

    Row signupButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Do not have an account'),
        CupertinoButton(
          child: const Text("Sign up here"),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => const SignupScreen()),
            );
          },
        )
      ],
    );

    Padding body = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        children: <Widget>[
          headerContainer,
          titleContainer,
          // const SizedBox(width: 10),
          // usernameContainer,
          // passwordContainer,
          usernamePasswordContainer,
          forgotText,
          loginContainer,
          Container(
            height: 100,
            alignment: Alignment.bottomCenter,
            child: signupButton,
          ),
        ],
      ),
    );

    return body;
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupState();
}

class _SignupState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Sign up'),
        ),
        child: Text("sameshit as login"));
  }
}

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});
  @override
  State<ForgotScreen> createState() => _ForgotState();
}

class _ForgotState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('sadsadnoqnd'),
        ),
        child: Text("???"));
  }
}

class LoggingPage extends StatelessWidget {
  const LoggingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(child: LoginScreen());
  }
}
