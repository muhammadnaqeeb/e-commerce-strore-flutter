import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/single_product_description_screen.dart';

import 'custom_snackbar_layout.dart';

class PopularItem extends StatelessWidget {
  String imageUrl;
  String productTitle;
  String productCatagory;
  int productPrice;
  String description;
  PopularItem({
    required this.imageUrl,
    required this.productTitle,
    required this.productCatagory,
    required this.productPrice,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartItemsList = context.watch<ProductProvider>().cartItemsList;

    return Container(
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return ProductDescription_Screen(
              imgUrl: imageUrl,
              catogory: productCatagory,
              price: productPrice,
              title: productTitle,
              description: description,
            );
          })));
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.network(imageUrl),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(productCatagory),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '4.5 ⭐',
                    style: TextStyle(
                      color: Colors.yellow.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // cartItemsList.add(
                      //   {
                      //     'title': productTitle,
                      //     'quantity': 1,
                      //     'price': productPrice
                      //   },
                      // );
                      // OR
                      context.read<ProductProvider>().addProduct({
                        'title': productTitle,
                        'quantity': 1,
                        'price': productPrice,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: CustomSnackbarLayout(),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(milliseconds: 1500),
                      ));
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                  Text(
                    '\$$productPrice',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
