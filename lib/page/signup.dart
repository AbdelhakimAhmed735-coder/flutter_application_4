import 'package:flutter/material.dart';
import 'package:flutter_application_4/app_image.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

bool isHidden = true;

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(251, 246, 246, 245),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: SingleChildScrollView(
          child: Form(
            key: formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 80),

                Center(child: Image.asset(AppImage.carrot)),

                const SizedBox(height: 120),

                const Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const Text(
                  "Enter your credentials to continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 20),

                const Text("User name"),

                const SizedBox(height: 5),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your user name",

                    prefixIcon: const Icon(Icons.person),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your user name";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                const Text("Email"),

                const SizedBox(height: 5),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    hintText: "Example@gmail.com",

                    prefixIcon: const Icon(Icons.email),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
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

                const SizedBox(height: 12),

                const Text("Password"),

                const SizedBox(height: 12),

                TextFormField(
                  obscureText: isHidden,

                  keyboardType: TextInputType.visiblePassword,

                  decoration: InputDecoration(
                    hintText: "Enter your password",

                    prefixIcon: const Icon(Icons.lock),

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

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
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

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.only(left: 210),
                  child: Text("Forgot Password?"),
                ),

                const SizedBox(height: 10),

                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 14),

                    children: [
                      TextSpan(text: "By continuing you agree to our "),

                      TextSpan(
                        text: "Terms of Service \nand Privacy Policy.",
                        style: TextStyle(
                          color: Color(0Xff53B175),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Signup Successfully")),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0Xff53B175),

                    foregroundColor: const Color(0XFFFFF9FF),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500),
                    ),

                    fixedSize: const Size(353, 67),
                  ),

                  child: const Text("Signup", style: TextStyle(fontSize: 30)),
                ),

                const SizedBox(height: 20),

                Center(
                  child: RichText(
                    text: const TextSpan(
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
        ),
      ),
    );
  }
}
