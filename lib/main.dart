import 'package:flutter/material.dart';

void main() {
  runApp(CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CoffeeShopHomePage(),
    );
  }
}

class CoffeeShopHomePage extends StatelessWidget {
  final List<CoffeeItem> coffeeItems = [
    CoffeeItem(
      name: 'Espresso',
      description: 'Strong black coffee made by forcing steam through ground coffee beans.',
      price: 2.99,
      imagePath: 'assets/espresso.jpg',
    ),
    CoffeeItem(
      name: 'Latte',
      description: 'Espresso with steamed milk and a small amount of foam.',
      price: 3.99,
      imagePath: 'assets/latte.jpg',
    ),
    CoffeeItem(
      name: 'Cappuccino',
      description: 'Espresso with equal parts steamed milk and foam.',
      price: 4.49,
      imagePath: 'assets/cappuccino.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView.builder(
        itemCount: coffeeItems.length,
        itemBuilder: (context, index) {
          return CoffeeItemCard(coffeeItem: coffeeItems[index]);
        },
      ),
    );
  }
}

class CoffeeItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  CoffeeItem({required this.name, required this.description, required this.price, required this.imagePath});
}

class CoffeeItemCard extends StatelessWidget {
  final CoffeeItem coffeeItem;

  const CoffeeItemCard({required this.coffeeItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            coffeeItem.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffeeItem.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  coffeeItem.description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${coffeeItem.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
