import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/model/post_model.dart';
import 'package:security/service/http_service.dart';

class UpdateController extends GetxController {
  late Post post;
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void saveAndExit() async {
    isLoading = true;
    update();
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    Post postUpdate =
    Post(id: post.id, title: title, body: body, userId: post.userId);
    var result = await Network.PUT(Network.API_UPDATE + postUpdate.id.toString(),
        Network.paramsUpdate(postUpdate));
    if (result != null) {
      Get.back(result: true);
    } else {
      Get.back(result: false);
    }
    isLoading = false;
    update();
  }
}
