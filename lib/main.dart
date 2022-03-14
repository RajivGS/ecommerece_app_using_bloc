import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerece_app/blocs/category/category_bloc.dart';
import 'package:ecommerece_app/blocs/product/product_bloc.dart';
import 'package:ecommerece_app/blocs/repositories/category/category_repo.dart';
import 'package:ecommerece_app/blocs/repositories/product/product_repo.dart';
import 'package:ecommerece_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerece_app/config/app_router.dart';
import 'package:ecommerece_app/config/theme.dart';
import 'package:ecommerece_app/screens/screen/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishList())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(CategoryRepository())..add(LoadCategories())),
        BlocProvider(create: (_) => ProductBloc(ProductRepository()))
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: const HomeScreen(),
      ),
    );
  }
}
