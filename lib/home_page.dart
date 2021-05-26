import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/app_controller.dart';

// Widget Variável
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

// Estada do Widget Variável
class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: FirebaseForm(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     setState(() {
      //       counter++;
      //     });
      //   },
      // ),
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
        TextField(
          decoration: InputDecoration(hintText: "Email"),
          onChanged: (value) {
            setState(() {
              email = value.trim();
            });
          },
        ),
        TextField(
          decoration: InputDecoration(hintText: "Password"),
          onChanged: (value) {
            setState(() {
              password = value.trim();
            });
          },
        ),
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
