import 'package:flutter/material.dart';

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

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.icon,
    required this.buttonText,
    required this.price,
    Key? key,
  }) : super(key: key);

  IconData icon;
  String buttonText;
  int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              )
            ],
          ),
          Container(
            width: 2,
            height: 30,
            color: Colors.white,
          ),
          Text(
            '\$ $price',
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
