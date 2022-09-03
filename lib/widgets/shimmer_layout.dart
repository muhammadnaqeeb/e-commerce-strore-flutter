import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

Widget loadingShimmer() => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey[200]!,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 1),
      child: Container(
          width: double.infinity,
          height: 74,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(18)),
          )),
    );
