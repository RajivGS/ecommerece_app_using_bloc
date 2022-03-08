import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerece_app/model/category_model.dart';
import 'package:ecommerece_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Lotus'),
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: Category.categories
                    .map((category) => HeroCarouselCard(category: category))
                    .toList(),
              ),
              const SectionTitle(title: 'RECOMMENDED'),
              ProductCarousel(
                  products: Product.products
                      .where((product) => product.isRecommended)
                      .toList()),
              const SectionTitle(title: 'MOST POPULAR'),
              ProductCarousel(
                  products: Product.products
                      .where((product) => product.isPopular)
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
