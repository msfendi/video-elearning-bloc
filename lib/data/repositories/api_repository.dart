import 'dart:convert';

import 'data_repository.dart';
import 'package:video_elearning/data/model/Post.dart';

class ApiRepository {
  final DataService dataService;

  ApiRepository({required this.dataService});

  Future<List<Post>> getPostList() async {
    final response = await dataService.getPosts();
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Failed to load post list');
    }
  }
}