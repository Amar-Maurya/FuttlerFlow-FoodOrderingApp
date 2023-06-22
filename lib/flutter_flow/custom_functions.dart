import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getUserNameFromEmail(String? emailId) {
  return emailId?.split("@").first;
}

dynamic updateQuantityOfProduct(
  dynamic product,
  bool isFromMyCart,
  int? counterValue,
) {
  if (!isFromMyCart) {
    if (product['quantity'] == 0) {
      product['quantity'] = 1;
    } else {
      product['quantity']++;
    }
  } else {
    product['quantity'] = counterValue;
  }
  return product;
}

int getProductQuantity(dynamic product) {
  return product["quantity"];
}

int getIndexOfSelectedItem(
  List<dynamic> appStateProduct,
  dynamic selectedProduct,
) {
  // get index from json list passing parameter data json
  for (int i = 0; i < appStateProduct.length; i++) {
    if (jsonEncode(appStateProduct[i]) == jsonEncode(selectedProduct)) {
      return i;
    }
  }
  return -1;
}

List<dynamic> updateMyCratAppState(List<dynamic> porductList) {
  // get the appstate  json list from json list which qunatity is more than zero
  List<dynamic> appStateProduct = [];
  for (dynamic product in porductList) {
    if (getProductQuantity(product) > 0) {
      appStateProduct.add(product);
    }
  }
  return appStateProduct;
}

double getTotalAmountOfMyCart(List<dynamic> myCartList) {
  // get the sum fo all the price in json list
  double totalAmount = 0;
  for (dynamic product in myCartList) {
    totalAmount += (getProductQuantity(product) * product['price']);
  }
  return totalAmount.ceilToDouble();
}

dynamic addMyCartToOrderList(
  List<dynamic> myCartList,
  double? totalAmount,
) {
  // convert json lsit into ander josn whcih contain json list order id , date and total amount
// create a new order object with order id, date and total amount
  final order = {
    'orderId': DateTime.now().millisecondsSinceEpoch.toString(),
    'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'totalAmount': totalAmount,
    'products': myCartList,
    'status': "pending"
  };

  // convert the order list to JSON and return it
  return <dynamic>[order];
}

List<dynamic> updateProductAppState(List<dynamic> newPorductList) {
  // passing json list set qunatity to zero to all product
  newPorductList.forEach((product) {
    if (product['quantity'] > 0) {
      product['quantity'] = 0;
    }
  });
  return newPorductList;
}
