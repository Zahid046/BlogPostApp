import 'dart:convert';

import 'package:blog_post_app/Posts.dart';
import 'package:http/http.dart';

class Services {
  static var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  static Future<List<Post>> getPosts() async {
    try {
      final response = await get(url);

      if (200 == response.statusCode) {
        List<dynamic> body = jsonDecode(response.body);
        List<Post> posts = body
            .map(
              (dynamic item) => Post.fromJson(item),
            )
            .toList();
        // final List<Post> posts = jsonDecode(response.body);
        //print(posts);
        return posts;
      }
    } catch (e) {
      return <Post>[];
    }
    throw "";
  }
}
