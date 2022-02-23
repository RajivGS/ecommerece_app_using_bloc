import 'package:flutter/material.dart';

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
    );
  }
}
