import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/signup.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_application_4/page/splash_page.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
