import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/images/app_image.dart';
import 'package:flutter_application_4/features/cart/cart_Page.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> products = [
    {"name": "Organic Bananas", "price": 4.99, "image": "🍌"},
    {"name": "Red Apple", "price": 4.99, "image": "🍎"},
    {"name": "Orange", "price": 3.99, "image": "🍊"},
    {"name": "Broiler Chicken", "price": 7.99, "image": "🍗"},
    {"name": "Beef Bone", "price": 6.99, "image": "🥩"},
  ];

  List<Map<String, dynamic>> filteredProducts = [];
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void searchProduct(String value) {
    setState(() {
      filteredProducts = products.where((product) {
        return product["name"].toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Store"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: cartItems),
                    ),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      "${cartItems.length}",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: Image.asset(AppImage.carrot),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on),
              Text(
                "Dhaka, Banassre",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextField(
                controller: searchController,
                onChanged: searchProduct,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Store",
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          product["image"],
                          style: const TextStyle(fontSize: 60),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        product["name"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "\$${product["price"]}",
                        style: const TextStyle(fontSize: 16),
                      ),

                      const Spacer(),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                cartItems.add(product);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${product["name"]} added to cart",
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var item in cartItems) {
      total += item["price"];
    }

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: cartItems.isEmpty
          ? const Center(
              child: Text("Cart is Empty", style: TextStyle(fontSize: 22)),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Text(
                            cartItems[index]["image"],
                            style: const TextStyle(fontSize: 35),
                          ),
                          title: Text(cartItems[index]["name"]),
                          subtitle: Text("\$${cartItems[index]["price"]}"),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Total: \$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
