import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ProductsGrid(),
    );
  }
}

