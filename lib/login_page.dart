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
                )),
            color: Colors.deepPurple,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: TextField(
            decoration: InputDecoration(hintText: "Email"),
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
            decoration: InputDecoration(hintText: "Password"),
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
                      print('Login falhou!');
                  } on FirebaseAuthException catch (e) {
                    print(e);
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
                onPressed: () {
                  try {
                    auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                  } catch (e) {
                    print("Error on signup " + e);
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
            ]),
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
