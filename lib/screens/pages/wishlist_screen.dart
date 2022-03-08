import 'package:ecommerece_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const WishListScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'WishList'),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.4),
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    isWishList: true,
                    widthFactor: 1.1,
                    leftPosition: 100,
                    product: state.wishlist.products[index],
                  ),
                );
              },
              itemCount: state.wishlist.products.length,
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
