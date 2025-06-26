import 'package:flutter/material.dart';


class CartItem {
  final int id;
  final String name;
  final String image;
  int ?sizeId;
  int ?colorId;
  int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    this.sizeId,
    this.colorId,
    this.quantity=1,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'sizeId': sizeId,
      'colorId': colorId,
      'quantity': quantity,
      'price': price,
    };
  }
}