part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  @override
  List<Object> get props => [cart];

  final Cart cart;
  const CartLoaded({this.cart = const Cart()});
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
