import 'package:flutter/material.dart';

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
                  width: widthValue - 5 - leftPosition,
                  height: 80,
                  decoration:
                      BoxDecoration(color: Colors.black.withAlpha(50)))),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 7 - leftPosition,
              height: 80,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(2 * .0),
                child: Row(
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
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_circle,
                                color: Colors.white))),
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
