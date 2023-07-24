// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userId;
  final int totalAmount;
  final DateTime timestamp;
  final bool isCompleted;
  final List<dynamic> items;
  final String address;
  final String paymentMethod;

  OrderModel({
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.timestamp,
    required this.isCompleted,
    required this.items,
    required this.address,
    required this.paymentMethod,
  });

  factory OrderModel.fromFirestore(DocumentSnapshot snapshot) {
    // final data = snapshot.data();

    return OrderModel(
        id: snapshot['id'],
        userId: snapshot['userId'],
        totalAmount: snapshot['totalAmount'],
        timestamp: (snapshot['timestamp'] as Timestamp).toDate(),
        isCompleted: snapshot['isCompleted'],
        items: snapshot['items'],
        address: snapshot['address'],
        paymentMethod: snapshot['paymentMethod']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'totalAmount': totalAmount,
      'timestamp': Timestamp.fromDate(timestamp),
      'items': items.map((item) => item.toMap()).toList(),
      'isCompleted': isCompleted,
      'paymentMethod': paymentMethod,
      'address': address,
    };
  }
}
