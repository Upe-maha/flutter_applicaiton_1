import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/blog_model.dart';

class BlogRepository {
  Future<List<BlogModel>> fetchBlogs() async {
    final String response = await rootBundle.loadString(
      'lib/data/local/blog_data.json',
    );

    final List data = json.decode(response);

    return data.map((e) => BlogModel.fromJson(e)).toList();
  }
}
