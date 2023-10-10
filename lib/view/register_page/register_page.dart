import 'package:authentication/constants/constants.dart';
import 'package:authentication/controller/auth_provider.dart';
import 'package:authentication/helpers/colors.dart';
import 'package:authentication/widgets/button.dart';
import 'package:authentication/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 

  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<AuthProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
              const Text("Lets create an account for you"),
              kHeigt25,

              //email textfield
              MyTextField(
                  controller: authprovider.registerEmailTextController,
                  hintText: 'Email',
                  obscureText: false),
              kHeigt25,

              //password textfield
              MyTextField(
                  controller: authprovider.registerPassWordTextController,
                  hintText: 'Password',
                  obscureText: true),

              kHeigt10,

              //conform password textfiled
              MyTextField(
                  controller:
                      authprovider.registerConformPasswordTextController,
                  hintText: 'Conform Password',
                  obscureText: true),

              kHeigt10,

              //sign in button
              MyButton(onTap: signUp, text: 'Sign Up'),
              kHeigt25,
              // go to register page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kBlueColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }



   //sign up user
  void signUp() async {
    //get authprovider
    final authprovider = Provider.of<AuthProvider>(context,listen: false);
    if (authprovider.registerPassWordTextController.text !=
        authprovider.registerConformPasswordTextController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match!"),
        ),
      );
      return;
    }
    try {
      await authprovider.signUpWithEmailandPassword(
          authprovider.registerEmailTextController.text,
          authprovider.registerPassWordTextController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
