import 'package:ecommerece_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerece_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const CartScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Text('GO TO CART',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black))),
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.cart.freedeliveryString,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: const RoundedRectangleBorder(),
                                      elevation: 0.0),
                                  child: Text(
                                    'Add More Items',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.white),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              itemCount: state.cart.products.length,
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                    product: state.cart.products[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 40.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('SUBTOTAL',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                    Text('\$${state.cart.subtotalString}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Delivery Fee',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                    Text('\$${state.cart.deliveryFeeString}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black.withAlpha(50)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.all(5.0),
                                height: 40,
                                decoration:
                                    const BoxDecoration(color: Colors.black),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.white)),
                                      Text('\$${state.cart.totalString}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Text("Something went wrong");
            }
          },
        ));
  }
}
