// lib/services/hive_service.dart

import 'package:financialservicesapp/features/products/models/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveService {
  static Box<ProductModel> get productBox => Hive.box<ProductModel>('products');

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelAdapter());
    await Hive.openBox<ProductModel>('products');
  }

  static void saveProduct(ProductModel product) {
    productBox.put(product.id, product);
  }

  static List<ProductModel> getCachedProducts() {
    return productBox.values.toList();
  }
}