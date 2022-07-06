import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:security/controllers/payment_controller.dart';
import 'package:security/model/post_model.dart';
import 'package:security/pages/update_page.dart';

Widget itemPaymentPosts(PaymentController controller, Post post) {
  return Card(
    child: Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: (_) {
              controller.apiPostDelete(post);
            },
            icon: Icons.delete,
          ),
        ],
      ),
      startActionPane: ActionPane(
        dragDismissible: true,
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.blue,
            onPressed: (_) {
              Get.to(() => UpdatePage(post: post))?.then((value) {
                if (value == true) {
                  controller.apiPostList();
                }
              });
            },
            icon: Icons.edit,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          post.title!.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(post.body!),
      ),
    ),
  );
}
