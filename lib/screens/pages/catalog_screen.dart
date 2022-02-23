import 'package:ecommerece_app/model/model.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        builder: (_) => CatalogScreen(category: category),
        settings: const RouteSettings(name: routeName));
  }

  final Category category;
  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.15),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              widthFactor: 2.2,
              product: categoryProducts[index],
            ),
          );
        },
        itemCount: categoryProducts.length,
      ),
    );
  }
}
