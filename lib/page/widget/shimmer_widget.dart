import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_hi_bank/constant/colors.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key, required this.width, this.height = 18})
      : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: kColorMainGrey,
        highlightColor: kColorMainLine,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kColorMainGrey,
          ),
        ),
      ),
    );
  }
}
