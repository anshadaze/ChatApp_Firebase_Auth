import 'package:cloud_firestore/cloud_firestore.dart';

class PostsServices {
  //Fetch posts from Firebase Firestore
  Future<QuerySnapshot<Map<String, dynamic>>> fetchPosts() async {
    try {
      return await FirebaseFirestore.instance
          .collection("User Posts")
          .orderBy("TimeStamp", descending: false)
          .get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<void>addPost(String user,String message)async{
  try{
    await FirebaseFirestore.instance.collection("User Posts").add({
      'UserEmail':user,
      'Message':message,
      'TimeStamp':Timestamp.now(),
    });
   
  }catch(e){
    throw Exception(e.toString());

  }
}
}
