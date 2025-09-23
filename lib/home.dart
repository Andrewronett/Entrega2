import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCart;
  const HomeScreen({super.key, required this.onAddToCart});

  final List<Map<String, dynamic>> products = const [
    {"name": "Auriculares Gamer", "price": 150000, "image": "🎧"},
    {"name": "Teclado Mecánico", "price": 250000, "image": "⌨️"},
    {"name": "Mouse RGB", "price": 80000, "image": "🖱️"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.deepPurple.shade700,
          child: ListTile(
            leading: Text(product["image"], style: const TextStyle(fontSize: 32)),
            title: Text(product["name"],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text("\$${product["price"]}"),
            trailing: ElevatedButton(
              onPressed: () => onAddToCart(product),
              child: const Text("Agregar"),
            ),
          ),
        );
      },
    );
  }
}
