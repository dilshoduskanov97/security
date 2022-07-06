import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/controllers/update_controller.dart';
import 'package:security/model/post_model.dart';

class UpdatePage extends StatefulWidget {
  static const String id = "update_page";

  Post post;

  UpdatePage({Key? key, required this.post}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<UpdateController>().post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
        init: UpdateController(),
        builder: (_controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Create post"),
              centerTitle: true,
              actions: [
                TextButton(
                    onPressed: () {
                      _controller.saveAndExit();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: _controller.titleController
                            ..text = _controller.post.title!,
                          maxLines: null,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(bottom: 10, top: 10),
                              hintText: "Title"),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _controller.bodyController
                            ..text = _controller.post.body!,
                          maxLines: null,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: "Body",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  ),
                ),
                _controller.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : const SizedBox.shrink(),
              ],
            ),
          );
        });
  }
}
