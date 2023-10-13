import 'package:authentication/controller/posts_provider.dart';
import 'package:authentication/view/home_page/widgets/delete_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatonPost extends StatelessWidget {
  final String message;
  final String user;
  final String postid;
  ChatonPost(
      {super.key,
      required this.message,
      required this.user,
      required this.postid});
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user,
                style: TextStyle(color: Color.fromARGB(255, 88, 86, 86)),
              ),
              Text(message),
            ],
          ),

          if(currentUser.email==user)
          DeleteButton(
            //delete a post
            onTap: () {
              //show a dialoge box asking for  confirmation before deleting the post
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Post'),
                  content:
                      const Text('Are you sure you want to delete this post?'),
                  actions: [
                    //CANCEL BUTTON
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                    //DELETE BUTTON
                    TextButton(
                        onPressed: () async {
                          //post delete
                          Provider.of<PostsProvider>(context, listen: false)
                              .deletePost(postid);

                          //dismiss the dialoge
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
