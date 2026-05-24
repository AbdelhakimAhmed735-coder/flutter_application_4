import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/images/app_image.dart';
import 'package:flutter_application_4/page/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(251, 246, 246, 245),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 80),

            Center(child: Image.asset(AppImage.carrot)),

            SizedBox(height: 145),

            Text(
              "Login",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),

            Text(
              "Enter your emails and password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(height: 20),

            Text("Email"),

            SizedBox(height: 5),

            TextFormField(
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(
                hintText: "Email",

                prefixIcon: Icon(Icons.email),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }

                if (!value.contains("@") || !value.contains(".")) {
                  return "Enter valid email";
                }

                return null;
              },
            ),

            SizedBox(height: 12),

            Text("Password"),

            SizedBox(height: 12),

            TextFormField(
              obscureText: isHidden,

              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                hintText: "Password",

                prefixIcon: Icon(Icons.lock),

                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },

                  icon: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                ),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                }

                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }

                return null;
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 210),
              child: Text("Forgot Password?"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0Xff53B175),
                foregroundColor: Color(0XFFFFF9FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(500),
                ),
                fixedSize: Size(353, 67),
              ),
              child: Text("Login", style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),

                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Color(0Xff53B175),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
