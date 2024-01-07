import 'dart:convert';

import 'package:infinity_list/model/comment.dart';
import 'package:http/http.dart' as http;

class CommentService {
  // https://jsonplaceholder.typicode.com/comments?_start=0&_limit=20
  static const String _url = "jsonplaceholder.typicode.com";

  static Future<List<Comment>> fetchCommentList({int start=0, int limit=20}) async {
    List<Comment> result = [];
    var uri = Uri.https(_url, "comments", {
      "_start": start.toString(),
      "_limit": limit.toString()
    });
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var list = json.decode(response.body) as List;
        for (var e in list) {
          result.add(Comment.fromJson(e));
        }
      }
    }
    catch (e) {
      print(e.toString());
    }
    return result;
  }
}