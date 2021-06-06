import 'package:blog_post_app/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DetailScreen.dart';
import 'Posts.dart';

class JsonPostsParse extends StatefulWidget {
  JsonPostsParse() : super();

  @override
  _JsonPostsParseState createState() => _JsonPostsParseState();
}

class _JsonPostsParseState extends State<JsonPostsParse> {
  List<Post> _posts = [];
  bool _loading = true;
  ScrollController _scrollController = ScrollController();
  List<Post> _fullList = [];
  //int _currentMax = 15;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loading = true;

    Services.getPosts().then((posts) {
      setState(() {
        _fullList = posts;
        _posts = posts.sublist(0, 15);
        _loading = false;
        //print(_posts);
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_getMoreData();
      }
    });
  }

  /*_getMoreData() {
    //print("Get more data");

    if (_currentMax < 90) {
      for (int i = _currentMax; i < _currentMax + 15; i++) {
        _posts.add(_fullList[i]);
        print(i);
      }
      _currentMax = _currentMax + 15;

      setState(() {});
    } else {
      if (_currentMax > 99) {
        print("Data Ended");
      } else {
        for (int i = _currentMax; i < _currentMax + 10; i++) {
          _posts.add(_fullList[i]);
          print(i);
        }
        _currentMax = _currentMax + 10;

        setState(() {});
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading...." : "Blog Posts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: ListView.builder(
              controller: _scrollController,
              // ignore: unnecessary_null_comparison
              itemCount: null == _posts ? 0 : _posts.length,
              itemBuilder: (context, index) {
                // if (index == _posts.length) {
                //   return CupertinoActivityIndicator();
                // }
                Post post = _posts[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      post.title.length > 30
                          ? post.title.substring(0, 30) + "...."
                          : post.title,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(post: _posts[index]),
                        ),
                      );
                    },
                    subtitle: Text(post.body.length > 100
                        ? post.body.substring(0, 100) + "...."
                        : post.body),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
