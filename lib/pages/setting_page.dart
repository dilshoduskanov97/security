import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/controllers/setting_controller.dart';
import 'package:security/views/item_setting_post.dart';

class SettingPage extends StatefulWidget {
  static const String id = "main_page";

  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<SettingController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
        centerTitle: true,
      ),
      body: GetX<SettingController>(
        init: SettingController(),
        builder: (_controller){
          return Stack(
            children: [
              ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemSettingPosts(_controller, _controller.items[index]);
                },
              ),
              _controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.goToCreate(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
