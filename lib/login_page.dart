import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/app_controller.dart';
import 'package:hello/home_page.dart';
import 'package:progress_indicator_button/progress_button.dart';

// Widget Variável
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

// Estada do Widget Variável
class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: FirebaseForm(),
      ),
    );
  }
}

class FirebaseForm extends StatefulWidget {
  @override
  _FirebaseForm createState() => _FirebaseForm();
}

class _FirebaseForm extends State<FirebaseForm> {
  String email, password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 60),
          child: Title(
            title: 'Hackers News',
            child: Text('Hackers News',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )),
            color: Colors.deepPurple,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Email",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
            ),
            onChanged: (value) {
              setState(() {
                email = value.trim();
              });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Password",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
            ),
            onChanged: (value) {
              setState(() {
                password = value.trim();
              });
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 50,
              child: ProgressButton(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.deepPurple,
                strokeWidth: 2,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: (AnimationController controller) async {
                  controller.forward();
                  try {
                    var authUser = await auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (authUser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                      controller.reset();
                    } else {
                      controller.reset();
                      AppController.instance
                          .changeLoginMessageError('Login Failed');
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e);
                    controller.reset();

                    AppController.instance.changeLoginMessageError(e.message);
                  }
                },
              ),
            ),
            Container(
              width: 100,
              height: 50,
              child: ProgressButton(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.deepPurple,
                strokeWidth: 2,
                child: Text(
                  "Sign-Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: (AnimationController controller) async {
                  controller.forward();
                  try {
                    var createUser = await auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (createUser != null)
                      AppController.instance.changeSuccessRegister();
                    else
                      AppController.instance
                          .changeLoginMessageError('Register Failed.');

                    controller.reset();
                  } catch (e) {
                    controller.reset();
                    AppController.instance
                        .changeLoginMessageError('Register Failed.');
                  }
                },
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Text(
            AppController.instance.loginErrorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Text(
            AppController.instance.successRegister,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
