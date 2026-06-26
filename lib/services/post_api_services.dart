import 'package:dio/dio.dart';
import '../models/post_model.dart';

class PostApiService {
  final Dio dio = Dio();

  Future<List<PostModel>> getPosts() async {
    Response response = await dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );

    List data = response.data;

    return data.map((e) => PostModel.fromJson(e)).toList();
  }
}