import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/color/appcolor.dart';
import 'package:flutter_application_4/core/color/textcolor.dart';
import 'package:flutter_application_4/core/images/app_image.dart';
import 'package:flutter_application_4/features/auth/login_page.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImage.onbording),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 485),
                  child: Image.asset(AppImage.group),
                ),
                Text(
                  "   Welcome \n to our store",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Textcolor.primary,
                  ),
                ),
                Text(
                  "Get your groceries in as fast as one hour",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Textcolor.primary,
                  ),
                ),
                SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolor.bottombackgroundColor,
                    foregroundColor: Appcolor.bottomforegroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(500),
                    ),
                    fixedSize: Size(353, 67),
                  ),
                  child: Text("Get Start", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
