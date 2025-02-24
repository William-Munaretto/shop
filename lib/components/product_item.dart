import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product!.imageUrl),
      ),
      title: Text(product!.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.productForm, arguments: product);
              },
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Produto'),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          provider.deleteProduct(product!);
                          Navigator.of(ctx).pop(false);
                        },
                        child: const Text('Sim'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: const Text('Não'),
                      )
                    ],
                  ),
                );
              },
              color: Colors.red,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
