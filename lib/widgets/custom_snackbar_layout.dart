import 'package:flutter/material.dart';

class CustomSnackbarLayout extends StatelessWidget {
  const CustomSnackbarLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.done,
          color: Colors.green,
        ),
        SizedBox(
          width: 10,
        ),
        Text('Product Added to cart'),
      ],
    );
  }
}
