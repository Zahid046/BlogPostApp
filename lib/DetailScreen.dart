import 'package:flutter/material.dart';

import 'Posts.dart';

class DetailScreen extends StatelessWidget {
  final Post post;

  DetailScreen({@required this.post});

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              Text(post.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0)),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(post.userId.toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ],
              ),
              SizedBox(height: 25),
              Container(
                child: Text(
                  post.body,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
