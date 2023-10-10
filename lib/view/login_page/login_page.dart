import 'package:authentication/constants/constants.dart';
import 'package:authentication/controller/auth_provider.dart';
import 'package:authentication/helpers/colors.dart';
import 'package:authentication/widgets/button.dart';
import 'package:authentication/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<AuthProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundcolor,
      body: Form(
        key: formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //lgo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  kHeigt50,

                  //welcome back messege
                  const Text("Welcome back,you've been missed!"),
                  kHeigt25,

                  //email textfield
                  MyTextField(
                    controller: authprovider.LoginEmailTextController,
                    hintText: 'Email',
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter email';
                      }
                    },
                  ),
                  kHeigt25,

                  //password textfield
                  MyTextField(
                      controller: authprovider.LoginPassWordTextController,
                      hintText: 'Password',
                      obscureText: true,
                       validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter password';
                      }
                    },
                      ),
                      

                  kHeigt10,

                  //sign in button
                  MyButton(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          final authProvider =
                              Provider.of<AuthProvider>(context, listen: false);
                          try {
                            await authProvider.signInWithEmailandPassword(
                                authProvider.LoginEmailTextController.text,
                                authProvider.LoginPassWordTextController.text);
                            authProvider.LoginEmailTextController.clear();
                            authProvider.LoginPassWordTextController.clear();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  e.toString(),
                                ),
                              ),
                            );
                          }
                        }
                      },
                      text: 'Sign In'),
                  kHeigt25,
                  // go to register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: kBlueColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
