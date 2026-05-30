import 'package:flutter/material.dart';
import 'package:flutter_application_4/features/cart/cart_Page.dart';
import 'package:flutter_application_4/features/explore/explore.dart';
import 'package:flutter_application_4/features/favorite/favorite_Page.dart';
import 'package:flutter_application_4/features/home/home_Page.dart';
import 'package:flutter_application_4/features/profilen/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userName, required this.email});

  final String userName;
  final String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Profile(userName: widget.userName, email: widget.email),
      Homepage(),
      Cartpage(),
      Explore(),
      Favoritepage(),
    ];

    return Scaffold(
      body: pages[myIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Cart"),

          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
