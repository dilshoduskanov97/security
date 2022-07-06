import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/controllers/main_controller.dart';
import 'package:security/controllers/payment_controller.dart';
import 'package:security/pages/create_page.dart';
import 'package:security/views/item_main_post.dart';
import 'package:security/views/item_payment_post.dart';

class PaymentPage extends StatefulWidget {
  static const String id = "main_page";

  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<PaymentController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (_controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("GetX"),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                ListView.builder(
                  itemCount: _controller.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemPaymentPosts(
                        _controller, _controller.items[index]);
                  },
                ),
                _controller.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : const SizedBox.shrink(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => const CreatePage())!.then((value) {
                  if (value == true) {
                    _controller.apiPostList();
                  }
                });
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
