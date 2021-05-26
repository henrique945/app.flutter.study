import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppWidget(
    title: 'Hackers News',
  ));
}
