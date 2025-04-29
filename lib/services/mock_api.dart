// // lib/services/mock_api.dart
//
// import 'dart:async';
//
// import 'package:financialservicesapp/features/products/models/product_model.dart';
//
//
// class MockApi {
//   Future<List<ProductModel>> fetchProducts() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return [
//       ProductModel(id: 1, title: 'Loan Services', description: 'Flexible loan plans for individuals and businesses.'),
//       ProductModel(id: 2, title: 'Investment Plans', description: 'Grow your wealth with our investment solutions.'),
//       ProductModel(id: 3, title: 'Savings Accounts', description: 'Secure and rewarding savings accounts.'),
//     ];
//   }
// }