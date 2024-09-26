import 'dart:async';
import 'package:flutter/material.dart';

import '../model/postmodile.dart';
import '../servise/service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Post> items = [];
  bool isLoading = false;

  Future apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.BASE + Network.API_LIST);

    if (response != null) {
      items = Network.parsePostList(response);
    }

    isLoading = false;
    notifyListeners();
  }


  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(Network.BASE + Network.API_DELETE + post.id.toString());

    isLoading = false;
    notifyListeners();

    return response != null;
  }
}