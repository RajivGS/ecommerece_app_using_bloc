import 'package:ecommerece_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerece_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerece_app/config/app_router.dart';
import 'package:ecommerece_app/config/theme.dart';
import 'package:ecommerece_app/screens/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => SubjectBloc(),
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishList())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
      ],
      child: MaterialApp(
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: const HomeScreen(),
      ),
    );
  }
}
