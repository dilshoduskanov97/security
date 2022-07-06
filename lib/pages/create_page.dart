import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/controllers/create_controller.dart';

class CreatePage extends StatefulWidget {
  static const String id = "create_page";

  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateController>(
        init: CreateController(),
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
                          controller: _controller.titleController,
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
                          controller: _controller.bodyController,
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
