import 'package:flutter/material.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;
  const WallPost(
      {super.key,
      required this.message,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      margin: EdgeInsets.all(15),
     padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user,style: TextStyle(color: Color.fromARGB(255, 88, 86, 86)),),
              Text(message),
            ],
          )
        ],
      ),
    );
  }
}
