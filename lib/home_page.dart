import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('New page'),
      ],
    );
  }
}
