import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/controllers/main_controller.dart';
import 'package:security/views/item_main_post.dart';

class MainPage extends StatefulWidget {
  static const String id = "main_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
        centerTitle: true,
      ),
      body: Obx(()=>Stack(
        children: [
          ListView.builder(
            itemCount: Get.find<MainController>().items.length,
            itemBuilder: (BuildContext context, int index) {
              return itemMainPosts(Get.find<MainController>(), Get.find<MainController>().items[index]);
            },
          ),
          Get.find<MainController>().isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : const SizedBox.shrink(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.goToCreate(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
