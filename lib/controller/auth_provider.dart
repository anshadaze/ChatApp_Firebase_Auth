import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController registerEmailTextController = TextEditingController();
  TextEditingController registerPassWordTextController =
      TextEditingController();
  TextEditingController registerConformPasswordTextController =
      TextEditingController();
  TextEditingController LoginEmailTextController = TextEditingController();
  TextEditingController LoginPassWordTextController = TextEditingController();

  bool showLoginPage = true;

  void togglepages() {
    showLoginPage = !showLoginPage;
    notifyListeners();
  }
}
