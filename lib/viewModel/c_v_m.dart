import 'dart:math';
import 'package:flutter/cupertino.dart';

import '../model/postmodile.dart';
import '../pages/home_page.dart';
import '../servise/service.dart';

class CreateViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostCreate(BuildContext context, String title, String body) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.POST(
        Network.BASE + Network.API_CREATE,
        Network.paramsCreate(
            Post(
                userId: Random().nextInt(30),
                id: Random().nextInt(30),
                title: title,
                body: body
            )
        )
    );

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      // return response;
    }

    isLoading = false;
    notifyListeners();
  }
}