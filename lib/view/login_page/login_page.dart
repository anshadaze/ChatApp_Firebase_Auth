import 'package:authentication/constants/constants.dart';
import 'package:authentication/controller/auth_provider.dart';
import 'package:authentication/helpers/colors.dart';
import 'package:authentication/widgets/button.dart';
import 'package:authentication/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
   LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) {
        var authprovider=Provider.of<AuthProvider>(context);
    return SafeArea(child: Scaffold(
     backgroundColor:backgroundcolor,
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
            const Text("Welcome back,you've been missed!"),
            kHeigt25, 
            
            
            //email textfield
            MyTextField(controller:authprovider.LoginEmailTextController, hintText:'Email', obscureText:false),
            kHeigt25,
            
            
            //password textfield
            MyTextField(controller:authprovider.LoginPassWordTextController, hintText: 'Password', obscureText:true),
            
            kHeigt10,
            
            //sign in button
            MyButton(onTap:signIn,
             text:'Sign In'),
            kHeigt25,
            // go to register page
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text('Not a member?',style: TextStyle(color: Colors.grey[700]),),
              const SizedBox(width: 4,),
              GestureDetector(
                onTap: widget.onTap,
                child: Text("Register now",style: TextStyle(fontWeight: FontWeight.bold,color:kBlueColor ),))
             ],
          )
          ],
         ),
       ),
     ),

    ));
  }

    //sign in button ontap
    void signIn()async{
final authProvider=Provider.of<AuthProvider>(context,listen: false);
    try{
      await authProvider.signInWithEmailandPassword(
        authProvider. LoginEmailTextController.text,
       authProvider.LoginPassWordTextController.text);
  
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),),),);

    }
  }
}