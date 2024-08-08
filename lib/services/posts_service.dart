import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PostService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future dataPost() async {
    print('$baseUrl/posts');
    var response = await http.get(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
    );

    debugPrint("Data Posts : " + response.body);
    if (response.statusCode != 200) return json.decode(response.body);
    return json.decode(response.body);
  }

  static Future searchPosts(String id) async {
    print('$baseUrl/posts/$id');
    var response = await http.get(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    debugPrint("Search Posts : " + response.body);
    if (response.statusCode != 200) return null;
    return json.decode(response.body);
  }
}
