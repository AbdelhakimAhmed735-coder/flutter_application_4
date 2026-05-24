import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,

            leading: Icon(icon, size: 28, color: Colors.black),

            title: Text(
              title,

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),

            onTap: onTap,
          ),

          const Divider(thickness: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
