import 'package:flutter/material.dart';
import '../models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepetim"), backgroundColor: Colors.teal.shade100),
      body: cartItems.isEmpty
          ? const Center(child: Text("Sepetiniz henüz boş."))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(item.imageUrl, width: 50, fit: BoxFit.cover),
                  title: Text(item.name),
                  subtitle: Text("${item.brand} - ${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () {
                      // Rapor: Basit state güncelleme (setState)
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}