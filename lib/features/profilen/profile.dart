import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/images/app_image.dart';
import 'package:flutter_application_4/core/widget/custom_tile.dart';
import 'package:flutter_application_4/features/auth/signup.dart';

class Profile extends StatefulWidget {
  final String userName;
  final String email;

  const Profile({super.key, required this.userName, required this.email});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,

                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber,
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),

                        child: Image.asset(
                          AppImage.profilephoto,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          widget.userName,

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          widget.email,

                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                CustomTile(
                  icon: Icons.shopping_bag_outlined,
                  title: "Orders",
                  onTap: () {},
                ),

                CustomTile(
                  icon: Icons.person_outline,
                  title: "My Details",
                  onTap: () {},
                ),

                CustomTile(
                  icon: Icons.location_on_outlined,
                  title: "Delivery Address",
                  onTap: () {},
                ),

                CustomTile(
                  icon: Icons.credit_card_outlined,
                  title: "Payment Methods",
                  onTap: () {},
                ),

                CustomTile(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  onTap: () {},
                ),

                CustomTile(
                  icon: Icons.help_outline,
                  title: "Help",
                  onTap: () {},
                ),

                CustomTile(
                  icon: Icons.info_outline,
                  title: "About",
                  onTap: () {},
                ),
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
                  child: Text("Log out", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
