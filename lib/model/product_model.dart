import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
    this.name,
    this.category,
    this.imageUrl,
    this.price,
    this.isRecommended,
    this.isPopular,
  );

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    const Product(
      'Soft Drink #1',
      'Soft Drinks',
      'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      2.99,
      true,
      false,
    ),
    const Product(
      'Soft Drink #2',
      'Soft Drinks',

      'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      2.99,
      false,
      true,
    ),
    const Product(
      'Soft Drink #3',
      'Soft Drinks',

      'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      2.99,
      true,
      true,
    ),
    const Product(
      'Smoothies #1',
      'Smoothies',

      'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      2.99,
      true,
      false,
    ),
    const Product(
      'Smoothies #2',
      'Smoothies',

      'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      2.99,
      false,
      false,
    ),
    const Product(
      'Soft Drink #1',
      'Soft Drinks',

      'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      2.99,
      true,
      false,
    ),
    const Product(
      'Soft Drink #2',
      'Soft Drinks',

      'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      2.99,
      false,
      true,
    ),
    const Product(
      'Soft Drink #3',
      'Soft Drinks',

      'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      2.99,
      true,
      true,
    ),
    const Product(
      'Smoothies #1',
      'Smoothies',

      'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      2.99,
      true,
      false,
    ),
    const Product(
      'Smoothies #2',
      'Smoothies',

      'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      2.99,
      false,
      false,
    ),
    const Product(
      'Soft Drink #1',
      'Soft Drinks',

      'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      2.99,
      true,
      false,
    ),
    const Product(
      'Soft Drink #2',
      'Soft Drinks',

      'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      2.99,
      false,
      true,
    ),
    const Product(
      'Smoothies #1',
      'Smoothies',

      'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      2.99,
      true,
      false,
    ),
    const Product(
      'Smoothies #2',
      'Smoothies',

      'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      2.99,
      false,
      false,
    )
  ];
}
