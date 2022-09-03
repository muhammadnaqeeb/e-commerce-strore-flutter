import 'package:flutter/material.dart';

class SaleSlideCard extends StatelessWidget {
  String discount;
  String description;
  String img;
  SaleSlideCard({
    required this.discount,
    required this.description,
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
            colors: [
              Color(0xFFBF953F),
              Color(0xFFFCF6BA),
            ],
            // Start and end of linear gradient color
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 3.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Image.asset(
                img,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'DISCOUNT',
                  style: TextStyle(),
                ),
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        discount,
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
