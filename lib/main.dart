import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:security/pages/payment_page.dart';
import 'package:security/pages/setting_page.dart';
import 'package:security/service/di_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SettingPage(),
    );
  }
}
