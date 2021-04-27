import 'package:flutter/material.dart';

main() {
  runApp(Container(
    child: Center(
      child: Text(
        'Hello World',
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.green, fontSize: 50),
      ),
    ),
    color: Colors.black,
  ));
}
