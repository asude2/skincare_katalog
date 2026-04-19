import 'dart:convert'; // JSON dönüşümü için şart
import 'package:flutter/services.dart'; // rootBundle (dosya okuma) için şart
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> allProducts = []; 
  List<Product> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    _loadProductsFromAsset(); // Uygulama açıldığında JSON'u yükle
  }

  // Rapor Madde 60 & 108: JSON Asset yönetimi simülasyonu
  Future<void> _loadProductsFromAsset() async {
    try {
      // assets/products.json dosyasını oku
      final String response = await rootBundle.loadString('assets/products.json');
      final List<dynamic> data = json.decode(response);
      
      setState(() {
        // JSON verisini Product nesnelerine dönüştür
        allProducts = data.map((item) => Product.fromJson(item)).toList();
        displayedProducts = allProducts;
      });
    } catch (e) {
      // Hata durumunda konsola yazdır (Dosya yolu yanlışsa buraya düşer)
      debugPrint("JSON Yükleme Hatası: $e");
    }
  }

  // Rapor: Arama ve Filtreleme mantığı
  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              product.brand.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      displayedProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skincare Essentials"),
        centerTitle: true,
        backgroundColor: Colors.teal.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Arama Çubuğu
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Ürün veya marka ara...',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Ürün Listesi (GridView)
          Expanded(
            child: displayedProducts.isEmpty
                ? const Center(child: Text("Ürün bulunamadı."))
                : GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Yan yana 2 kart
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];
                      return GestureDetector(
                        onTap: () {
                          // Rapor: Navigator ve Route Arguments kullanımı
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                  child: Image.network(
                                    product.imageUrl, 
                                    fit: BoxFit.cover, 
                                    width: double.infinity
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text(product.brand, style: const TextStyle(color: Colors.grey)),
                                    Text(product.price, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
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