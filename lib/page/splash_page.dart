import 'package:flutter/material.dart';
import 'package:flutter_application_4/app_image.dart';
import 'package:flutter_application_4/page/onbording.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImage.splash),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 600),
                child: ElevatedButton(
                  onPressed: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onbording()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(500),
                    ),
                    fixedSize: Size(353, 67),
                  ),
                  child: Text("next page", style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
