import 'package:flutter/material.dart';

main() {
  runApp(AppWidget(
    title: 'Hello World',
  ));
}

// Widget Imutavel
class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Container(
        color: Colors.black,
        child: Center(child: Text('Hello World2')),
      ),
    );
  }
}
