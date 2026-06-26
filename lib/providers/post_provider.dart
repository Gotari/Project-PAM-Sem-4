import 'package:flutter/material.dart';
import 'package:m05/services/post_api_services.dart';
import '../models/post_model.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> posts = [];

  Future<void> fetchPosts() async {
    posts = await PostApiService().getPosts();
    notifyListeners();
  }
}