import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {

  static AppController instance = AppController();

  bool isDarkTheme = false;
  String loginErrorMessage = '';
  String successRegister = '';

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  changeLoginMessageError(String newMessage) {
    loginErrorMessage = newMessage;
    notifyListeners();
  }

  changeSuccessRegister() {
    successRegister = 'User successfully created.';
    notifyListeners();
  }
}
