import 'package:ecommerece_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/model.dart';

class ProductCard extends StatelessWidget {
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
              width: widthValue,
              height: 150,
              child: Image.network(product.imageUrl, fit: BoxFit.cover)),
          Positioned(
              top: 65,
              left: leftPosition,
              child: Container(
                  width: widthValue - 5,
                  height: 80,
                  decoration:
                      BoxDecoration(color: Colors.black.withAlpha(50)))),
          Positioned(
            top: 65,
            left: leftPosition + 2,
            child: Container(
              width: widthValue,
              height: 80,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white)),
                          Text('\$${Product.products[0].price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white))
                        ]),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    const snackBar = SnackBar(
                                        content: Text("Added to your cart"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    context
                                        .read<CartBloc>()
                                        .add(AddProduct(product));
                                  },
                                  icon: const Icon(Icons.add_circle,
                                      color: Colors.white)));
                        } else {
                          return const Text("Something went wrong");
                        }
                      },
                    ),
                    isWishList
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete,
                                    color: Colors.white)))
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
