import 'package:authentication/controller/auth_provider.dart';
import 'package:authentication/controller/posts_provider.dart';
import 'package:authentication/view/home_page/widgets/wall_post_widget.dart';
import 'package:authentication/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

 

  

            

  @override
  Widget build(BuildContext context) {
    final postsprovider=Provider.of<PostsProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor:Colors.blueGrey,
        title: Text('Home Page'),
        actions: [
          //sign out button
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            //the wall
          Consumer<PostsProvider>(
            builder:(context, postsprovider, child) {
              final posts=postsprovider.posts;
              if(posts.isEmpty){
                 return Center(child: Text('No posts available.'));
              }else{
                return Expanded(
                  child:ListView.builder(
                  itemCount: posts.length,
                    itemBuilder:(context, index) {
                      final post=posts[index];

                      return WallPost(
                        message:post['Message'],
                         user: post['UserEmail']);
                    },));
              }
              
            },),

         

            Padding(
              
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  //textfield
                  Expanded(
                    
                      child: MyTextField(
                        
                          controller:postsprovider.textController,
                          hintText: "write something on the wall..",
                          obscureText: false)),
                  //post button
                  IconButton(
                      onPressed:postMessage,
                      icon: Icon(Icons.arrow_circle_up))
                ],
              ),
            ),

            //logged in as
            Text('Logged in as:' +  postsprovider.currentUser.email!),
          ],
        ),
      ),
    );
  }


  //sign user out
  void signOut() {
    //get auth service
    final authprovider = Provider.of<AuthProvider>(context, listen: false);
    authprovider.signOut();
  }
     //post message
            void postMessage(){ 
              final postsprovider = Provider.of<PostsProvider>(context,listen: false);
              //only post if there is something in the textfield
              if(postsprovider.textController.text.isNotEmpty){
               postsprovider.addPost(postsprovider.currentUser.email!,postsprovider.textController.text);

              postsprovider.textController.clear();
                
              }
            }
}
