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
        title: Text(post.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("good"),
      ),
    );
  }
}
