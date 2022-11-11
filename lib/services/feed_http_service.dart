import 'dart:convert';
import 'dart:io';

import 'package:instagram_clone/models/feed_model.dart';
import 'package:http/http.dart' as http;

class FeedHttpService {

  static const String feedUrl = 'https://codingapple1.github.io/app/data.json';
  static const List<String> feedMoreUrls = [
    'https://codingapple1.github.io/app/data.json',
    'https://codingapple1.github.io/app/more1.json',
    'https://codingapple1.github.io/app/more2.json',
  ];

  static Future<List<FeedModel>> getFeedListFromServer({String? url}) async {
    var result = await http.get(Uri.parse(url ?? feedUrl));

    if (result.statusCode == 200) {
      var x = jsonDecode(result.body);
      if (x is List) {
        return x.map((e) => FeedModel.fromJson(e)).toList();
      } else {
        if (x is Map<String, dynamic>) {
          return [FeedModel.fromJson(x)];
        } else {
          throw const HttpException('Received json is not in valid format. Contact server admin.');
        }
      }
    } else {
      throw const HttpException('Connection failed.');
    }
  }
}