/*
 * @Author       : Linloir
 * @Date         : 2022-03-03 09:37:16
 * @LastEditTime : 2022-03-03 15:37:41
 * @Description  : model class
 */

import 'dart:collection';

import 'package:flutter/material.dart';

class Item {
  const Item({required this.price, required this.count});
  final double price;
  final int count;
}

class CartModel extends ChangeNotifier {
  final List<Item> _cartItem = [];

  UnmodifiableListView get list => UnmodifiableListView(_cartItem);

  double get total {
    double total = 0;
    _cartItem.forEach((element) {
      total += element.count * element.price;
    });
    print('Total is ${total}');
    return total;
  }

  void add(Item newItem) {
    _cartItem.add(newItem);
    notifyListeners();
    print('Added');
  }

  // Note: This override is NECCESSARY
  //       Otherwise the inherited provider won't know whether
  //       the data has changed or not
  @override
  bool operator ==(Object other) {
    if (other is CartModel) {
      return list == other.list;
    } else {
      return false;
    }
  }
}
