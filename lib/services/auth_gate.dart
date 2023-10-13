import 'package:authentication/controller/auth_provider.dart';
import 'package:authentication/view/auth/login_or_register.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: authProvider.user != null ? HomePage() : LoginOrRegister(),
    );
  }
}
