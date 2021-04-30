import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
          child: GestureDetector(
        child: Text(
          'Hello $counter',
          style: TextStyle(fontSize: 25),
        ),
        onTap: () {
          setState(() {
            counter++;
          });
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
