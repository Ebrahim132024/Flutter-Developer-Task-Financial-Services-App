import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';

class ProductRepository {
  final String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel(
        id: json['id'],
        title: json['title'],
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        description: json['description'],
        category: json['category'],
        image: json['image'],
      )).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}