import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';

import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, producties, _) => IconButton(
              onPressed: () {
                producties.toggleFavorite();
              },
              icon: Icon(producties.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.red,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
        ),
      ),
    );
  }
}
