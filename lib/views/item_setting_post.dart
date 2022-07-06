import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:security/controllers/main_controller.dart';
import 'package:security/controllers/payment_controller.dart';
import 'package:security/controllers/setting_controller.dart';
import 'package:security/model/post_model.dart';

Widget itemSettingPosts(SettingController controller, Post post) {
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
              // viewModel.goToEdit(context, viewModel.posts[index]);
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
