import 'package:authentication/controller/auth_provider.dart';
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
  //text controller
  final textController = TextEditingController();

  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //sign user out
  void signOut() {
    //get auth service
    final authprovider = Provider.of<AuthProvider>(context, listen: false);
    authprovider.signOut();
  }
     //post message
            void postMessage(){ 
              //only post if there is something in the textfield
              if(textController.text.isNotEmpty){
                ///store in firebase
               final provider=Provider.of<AuthProvider>(context,listen: false);
               provider.addPost(currentUser.email!, textController.text);

               textController.clear();
                
              }
            }

            //align the messags to the right if the right if the sender is the current user,otherwise to the left
            

  @override
  Widget build(BuildContext context) {
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
          Consumer<AuthProvider>(
            builder:(context, authprovider, child) {
              final posts=authprovider.posts;
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
                          controller: textController,
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
            Text('Logged in as:' + currentUser.email!),
          ],
        ),
      ),
    );
  }
}
