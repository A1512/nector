import 'package:flutter/src/widgets/container.dart';

class OrderItem {
  final int order_id;
  final double amount;
  final String product_name;
  final String status;
  final String doi;

  OrderItem({
    required this.order_id,
    required this.amount,
    required this.product_name,
    required this.status,
    required this.doi,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      order_id: json['order_id'],
      amount: json['amount'],
      product_name: json['product_name'],
      status: json['status'],
      doi: json['doi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': order_id,
      'amount': amount,
      'product_name': product_name,
      'status': status,
      'doi': doi,
    };
  }

  static map(Container Function(dynamic e) param0) {}

}
