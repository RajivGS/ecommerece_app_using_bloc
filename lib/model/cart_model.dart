// ignore_for_file: must_be_immutable, prefer_collection_literals

import 'package:ecommerece_app/model/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freedeliveryString => freeDelivery(subtotal);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  double deliveryFee(subtotal) {
    if (subtotal >= 30.00) {
      return 0.0;
    } else {
      return 10.00;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal > 30.00) {
      return 'You have free delivery';
    } else {
      double missing = 30.00 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  double total(subtotal, deliveryfee) {
    return (subtotal + deliveryfee(subtotal));
  }

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  @override
  List<Object?> get props => [products];
}
