import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/images/app_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String userName, required String email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Image.asset(AppImage.carrot),
              SizedBox(height: 5),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 126),
                    child: Image.asset(AppImage.exclude),
                  ),
                  SizedBox(width: 2),
                  Text("Dhaka, Banassre", style: TextStyle(fontSize: 17)),
                ],
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(18.0),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: SizedBox(
                    height: 140,
                    width: double.infinity,

                    child: Stack(
                      children: [
                        /// الخلفية
                        Image.asset(
                          AppImage.maskgroup,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),

                        /// صورة الخضار
                        Positioned(
                          left: 10,
                          bottom: 0,
                          top: 0,

                          child: Image.asset(AppImage.pic, width: 120),
                        ),

                        /// النص
                        Positioned(
                          right: 20,
                          top: 35,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fresh Vegetables",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                "Get Up To 40% OFF",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
