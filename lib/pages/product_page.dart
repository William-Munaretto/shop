import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/App_drawer.dart';
import 'package:shop/models/product_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) => Text(products.items[i].name),
          itemCount: products.itemCount,
        ),
      ),
    );
  }
}
