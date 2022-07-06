import 'package:get/get.dart';
import 'package:security/controllers/create_controller.dart';
import 'package:security/controllers/main_controller.dart';
import 'package:security/controllers/payment_controller.dart';
import 'package:security/controllers/setting_controller.dart';
import 'package:security/controllers/update_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
  }
}
