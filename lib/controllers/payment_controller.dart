import 'dart:convert';

import 'package:get/get.dart';
import 'package:security/model/post_model.dart';
import 'package:security/service/http_service.dart';

class PaymentController extends GetxController {
  var isLoading = false;
  var items = [];

  void apiPostList() async {
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, {});
    if (response != null) {
      items =
          List<Post>.from(jsonDecode(response).map((x) => Post.fromJson(x)));
    } else {
      items = [];
    }
    isLoading = false;
    update();
  }

  void apiPostDelete(Post post) async {
    isLoading = true;
    update();
    var response = await Network.DELETE(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    }
    isLoading = false;
    update();
  }
}
