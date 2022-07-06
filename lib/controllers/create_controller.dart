import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/model/post_model.dart';
import 'package:security/service/http_service.dart';

class CreateController extends GetxController {
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void saveAndExit() async {
    isLoading = true;
    update();
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    Post postCreate = Post(title: title, body: body, userId: title.hashCode);
    var result = await Network.POST(
        Network.API_CREATE, Network.paramsCreate(postCreate));
    if (result != null) {
      Get.back(result: true);
    } else {
      Get.back(result: false);
    }
    isLoading = false;
    update();
  }
}
