import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

Widget loadingShimmer() => Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[400]!,
      period: const Duration(seconds: 1),
      child: Container(
        width: double.infinity,
        height: 74,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 110,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 50,
                    height: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
