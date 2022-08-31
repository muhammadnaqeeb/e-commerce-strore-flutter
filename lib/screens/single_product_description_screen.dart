import 'package:flutter/material.dart';

import '../widgets/custom_buttom.dart';

class ProductDescription_Screen extends StatelessWidget {
  String catogory;
  String title;
  int price;
  String description;
  String imgUrl;
  ProductDescription_Screen(
      {required this.imgUrl,
      required this.catogory,
      required this.title,
      required this.price,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              child: Image(
                image: NetworkImage(imgUrl),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catogory,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        color: Colors.grey, height: 1.3, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '⭐ 4.5',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    icon: Icons.shopping_cart,
                    buttonText: 'Add to card',
                    price: price,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
