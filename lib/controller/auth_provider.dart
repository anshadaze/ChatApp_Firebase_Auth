import 'package:authentication/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthServices authservices=AuthServices();

  TextEditingController registerEmailTextController = TextEditingController();
  TextEditingController registerPassWordTextController =
      TextEditingController();
  TextEditingController registerConformPasswordTextController = TextEditingController();
  TextEditingController LoginEmailTextController = TextEditingController();
  TextEditingController LoginPassWordTextController = TextEditingController();

  bool showLoginPage = true;
     //instance of auth

  User? _user;



  AuthProvider(){
  authservices.firebaseAuth.authStateChanges().listen((user) {
    _user=user;
    // fetchPosts();
    notifyListeners();
   });
  }
    User? get user => _user;

  void togglepages() {
    showLoginPage = !showLoginPage;
    notifyListeners();
  }






//sign user out
Future<void>signOut()async{
  return await FirebaseAuth.instance.signOut();
}

Future<UserCredential> signInWithEmailandPassword(String email,String password)async{
   return  authservices.signInWithEmailandPassword(email, password);
    
}

//create a new user
Future<UserCredential>signUpWithEmailandPassword(String email,password)async{
 return authservices.signUpWithEmailandPassword(email, password);
}


}
