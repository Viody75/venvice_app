import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingItem extends StatelessWidget {
  LoadingItem({required this.width, required this.height});
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey,
      child: Container(
        color: Colors.white,
        width: width,
        height: height,
      ),
    );
  }
}
