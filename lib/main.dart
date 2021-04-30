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
      home: HomePage(),
    );
  }
}

// Widget Variável
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

// Estada do Widget Variável
class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
          child: GestureDetector(
        child: Text('Hello $counter'),
        onTap: () {
          setState(() {
            counter++;
          });
        },
      )),
    );
  }
}
