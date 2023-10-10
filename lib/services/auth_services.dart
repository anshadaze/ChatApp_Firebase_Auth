import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
final FirebaseAuth firebaseAuth=FirebaseAuth.instance;



// sign user in
Future<UserCredential> signInWithEmailandPassword(String email,String password)async{
  try{
    //sign in
    UserCredential userCredential=await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }
  //catch any errors
  on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}

//create a new user
Future<UserCredential>signUpWithEmailandPassword(String email,password)async{
  try{
    UserCredential userCredential=await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }on FirebaseAuthMultiFactorException catch(e){
   throw Exception(e.code);
  }
}

}