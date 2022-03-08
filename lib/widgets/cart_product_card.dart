import 'package:flutter/material.dart';

import '../model/model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;

  const CartProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(product.imageUrl,
              width: 100, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: (Theme.of(context).textTheme.headline6)),
                Text('\$${product.price}',
                    style: (Theme.of(context).textTheme.headline6))
              ],
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.remove_circle)),
              const Text('1'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
            ],
          )
        ],
      ),
    );
  }
}
