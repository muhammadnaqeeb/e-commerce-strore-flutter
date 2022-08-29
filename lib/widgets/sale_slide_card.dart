import 'package:flutter/material.dart';

class saleSlideCard extends StatelessWidget {
  const saleSlideCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
            colors: [
              Color(0xFF7A60A5),
              Color(0xFF82C3DF),
            ],
            // Start and end of linear gradient color
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: Color(0xFF9689CE),
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Get Special the discount',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            '50 %\n OFF',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Image.asset(
                  'images/shoes.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ))
        ],
      ),
    );
  }
}
