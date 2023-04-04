import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../data/utils/color_pallete.dart';

Shimmer chatShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: ColorPallete.bgColor,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 20,
                  margin: const EdgeInsets.only(left: 50, right: 10),
                ),
              ),
              const SizedBox(height: 50, width: 50, child: CircleAvatar()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50, width: 50, child: CircleAvatar()),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 20,
                  margin: const EdgeInsets.only(left: 10, right: 50),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
