// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final int totalAmount;
  final DateTime timestamp;
  final bool isCompleted;
  final List<Cart> items;

  OrderModel({
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.timestamp,
    required this.isCompleted,
    required this.items,
  });

  OrderModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        userId = snapshot['userId'],
        totalAmount = snapshot['totalAmount'],
        items = (snapshot['items'] as List)
            .map((item) => Cart.fromMap(item))
            .toList(),
        isCompleted = snapshot['isCompleted'],
        timestamp = snapshot['timestamp'].toDate();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'totalAmount': totalAmount,
      'timestamp': Timestamp.fromDate(timestamp),
      'items': items.map((item) => item.toMap()).toList(),
      'isCompleted': isCompleted,
    };
  }
}
