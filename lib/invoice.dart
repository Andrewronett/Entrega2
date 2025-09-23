import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final double total;
  const InvoicePage({super.key, required this.cart, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Factura"), backgroundColor: Colors.deepPurple),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Detalles de la factura",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return ListTile(
                    title: Text(item['name']),
                    trailing: Text("\$${item['price']}"),
                  );
                },
              ),
            ),
            const Divider(),
            Text("Total: \$${total.toStringAsFixed(0)}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
