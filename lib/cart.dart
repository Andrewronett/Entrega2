import 'package:flutter/material.dart';
import 'invoice.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  const CartPage({super.key, required this.cart});

  double get total => cart.fold(0, (sum, item) => sum + (item['price'] as int));

  void goToInvoice(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvoicePage(cart: cart, total: total),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) {
      return const Center(
        child: Text("Tu carrito está vacío 🛒",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Carrito"), backgroundColor: Colors.deepPurple),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text("\$${item['price']}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => goToInvoice(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text("Comprar"),
            ),
          )
        ],
      ),
    );
  }
}
