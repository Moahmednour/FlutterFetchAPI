import 'dart:convert';

import 'package:restflutter/models/Post.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<Post>> fetchPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      List<Post> posts =
          result.map<Post>((json) => Post.fromJson(json)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  operator ==(Object other) {
    // TODO: implement ==
    throw UnimplementedError();
  }
}
