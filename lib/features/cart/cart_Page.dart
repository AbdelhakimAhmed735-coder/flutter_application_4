import 'package:flutter/material.dart';

class Cartpage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const Cartpage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var item in cartItems) {
      total += item["price"];
    }

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart"), centerTitle: true),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Cart is Empty",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Text(
                            item["image"],
                            style: const TextStyle(fontSize: 35),
                          ),
                          title: Text(item["name"]),
                          subtitle: Text("\$${item["price"]}"),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Checkout",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
