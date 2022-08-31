import 'package:flutter/material.dart';

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
