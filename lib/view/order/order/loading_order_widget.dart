import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingOrder extends StatelessWidget {
  const LoadingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.white,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.white,
                      width: 100,
                      height: 14,
                    ),
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.white,
                      width: 110,
                      height: 14,
                    ),
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.white,
                      width: 100,
                      height: 14,
                    ),
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.white,
                      width: 120,
                      height: 14,
                    ),
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.white,
                      width: 70,
                      height: 14,
                    ),
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.white,
                      width: 120,
                      height: 36,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
