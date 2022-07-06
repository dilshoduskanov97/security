import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/controllers/home_controller.dart';
import 'package:security/views/item_of_post.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostList();
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
            itemCount: _controller.items.length,
            itemBuilder: (BuildContext context, int index) {
              return itemOfPosts(_controller, _controller.items[index]);
            },
          ),
          _controller.isLoading.value
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
