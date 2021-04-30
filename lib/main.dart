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
    return Container(
      child: Center(
        child: Text(
          title,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.green, fontSize: 50),
        ),
      ),
      color: Colors.black,
    );
  }
}
