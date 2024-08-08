import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_hi_bank/models/posts_model.dart';
import 'package:test_hi_bank/services/posts_service.dart';

class PostsController extends GetxController {
  var listPosts = <PostsModels>[].obs;
  var loadingFecth = false.obs;

  var searchController = TextEditingController().obs;
  Timer? timer;


  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void onSearchChanged(String id) {
    if (timer?.isActive ?? false) timer?.cancel();
    timer = Timer(const Duration(milliseconds: 500), () {
      fetchPostById(id);
    });
  }

  void fetchPosts() async {
    loadingFecth.value = true;
    try {
      var data = await PostService.dataPost();
      if (data != null && data is List) {
        var posts = data.map((item) => PostsModels.fromJson(item)).toList();
        listPosts.addAll(posts);
        loadingFecth.value = false;
      } else {
        Get.snackbar('Error', 'Failed to load posts');
        loadingFecth.value = false;
      }
    } catch (e) {
      print('eror fetchPosts : $e');
      loadingFecth.value = false;
    }
  }

  void fetchPostById(String id) async {
    loadingFecth.value = true;
    listPosts.clear();
    if(id.isNotEmpty){
      try {
        var data = await PostService.searchPosts(id);
        if (data != null) {
          var posts = PostsModels.fromJson(data);
          listPosts.add(posts);
          loadingFecth.value = false;

        } else {
          Get.snackbar('Error', 'Posts ID is not found');
          loadingFecth.value = false;
        }
      } catch (e) {
        print('eror fetchPosts : $e');
        loadingFecth.value = false;
      }
    } else {
      fetchPosts();
    }
  }
}
