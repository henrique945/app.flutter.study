import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/app_controller.dart';

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
            title: 'Hacker News',
            child: Text('Hacker News',
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
            ElevatedButton(
              child: Text("Login"),
              onPressed: () async {
                try {
                  var authUser = await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (authUser != null)
                    print(authUser);
                  else
                    AppController.instance
                        .changeLoginMessageError('Login Failed');
                } on FirebaseAuthException catch (e) {
                  print(e);

                  AppController.instance.changeLoginMessageError(e.message);
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
            ElevatedButton(
              child: Text("Sign-Up"),
              onPressed: () async {
                try {
                  var createUser = await auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  if (createUser != null)
                    print(createUser);
                  else
                    AppController.instance
                        .changeLoginMessageError('Register Failed.');
                } catch (e) {
                  AppController.instance.changeLoginMessageError(e);
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
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
