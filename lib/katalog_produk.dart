import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String shopName;
  final double rating;
  final String city;
  final int soldCount;
  final double? originalPrice;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.shopName,
    required this.rating,
    required this.city,
    required this.soldCount,
    this.originalPrice,
  });
}

class KatalogProduk extends StatefulWidget {
  const KatalogProduk({super.key});

  @override
  State<KatalogProduk> createState() => _KatalogProdukState();
}

class _KatalogProdukState extends State<KatalogProduk> {
  final Set<String> _favoriteIds = {};

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Produk A',
      description: 'Deskripsi singkat untuk Produk A',
      price: 150000,
      imageUrl: 'https://picsum.photos/id/1/200/200',
      shopName: 'Toko Segar Jaya',
      rating: 4.8,
      city: 'Jakarta Selatan',
      soldCount: 120,
      originalPrice: 200000,
    ),
    Product(
      id: '2',
      name: 'Produk B',
      description: 'Deskripsi singkat untuk Produk B',
      price: 250000,
      imageUrl: 'https://picsum.photos/id/2/200/200',
      shopName: 'Elektronik Ku',
      rating: 4.5,
      city: 'Bandung',
      soldCount: 45,
    ),
    Product(
      id: '3',
      name: 'Produk C',
      description: 'Deskripsi singkat untuk Produk C',
      price: 350000,
      imageUrl: 'https://picsum.photos/id/3/200/200',
      shopName: 'Gadget Store',
      rating: 4.9,
      city: 'Surabaya',
      soldCount: 500,
      originalPrice: 400000,
    ),
    Product(
      id: '4',
      name: 'Produk D',
      description: 'Deskripsi singkat untuk Produk D',
      price: 450000,
      imageUrl: 'https://picsum.photos/id/4/200/200',
      shopName: 'Toko Serba Ada',
      rating: 4.2,
      city: 'Yogyakarta',
      soldCount: 12,
      originalPrice: 500000,
    ),
    Product(
      id: '5',
      name: 'Produk E',
      description: 'Deskripsi singkat untuk Produk E',
      price: 550000,
      imageUrl: 'https://picsum.photos/id/5/200/200',
      shopName: 'Mulia Shop',
      rating: 4.6,
      city: 'Semarang',
      soldCount: 89,
    ),
    Product(
      id: '6',
      name: 'Produk F',
      description: 'Deskripsi singkat untuk Produk F',
      price: 650000,
      imageUrl: 'https://picsum.photos/id/6/200/200',
      shopName: 'Tech Indo',
      rating: 4.7,
      city: 'Medan',
      soldCount: 30,
      originalPrice: 700000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Katalog Produk',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE2E8F0), height: 1),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 320,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                      ),
                      if (product.originalPrice != null)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00AA5B),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Diskon ${(100 - (product.price / product.originalPrice! * 100)).toInt()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: IconButton(
                          icon: Icon(
                            _favoriteIds.contains(product.id) ? Icons.favorite : Icons.favorite_border,
                            color: _favoriteIds.contains(product.id) ? Colors.red : Colors.white,
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_favoriteIds.contains(product.id)) {
                                _favoriteIds.remove(product.id);
                              } else {
                                _favoriteIds.add(product.id);
                              }
                            });
                          },
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(4),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1E293B),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 16),
                              const SizedBox(width: 2),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF475569)),
                              ),
                              const SizedBox(width: 6),
                              Container(width: 1, height: 10, color: const Color(0xFFCBD5E1)),
                              const SizedBox(width: 6),
                              Text(
                                '${product.soldCount} Terjual',
                                style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.storefront, color: Color(0xFF94A3B8), size: 14),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  product.shopName,
                                  style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, color: Color(0xFF94A3B8), size: 14),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  product.city,
                                  style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          if (product.originalPrice != null)
                            Text(
                              'Rp ${product.originalPrice!.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF94A3B8),
                                decoration: TextDecoration.lineThrough,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  'Rp ${product.price.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00AA5B),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE6F5EC),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(6),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Icon(Icons.add_shopping_cart, color: Color(0xFF00AA5B), size: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
    );
  }
}