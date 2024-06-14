import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoaderWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const LoaderWidget({super.key, required this.child, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SafeArea(
        child: ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return buildLoaderShimmer();
          },
        ),
      );
    } else {
      return child;
    }
  }

  Widget buildLoaderShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.ractangular(
            height: 50.sp,
            width: 200.sp,
          ),
          SizedBox(height: 3.sp),
          ShimmerWidget.ractangular(height: 40.sp),
        ],
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;
  // const ShimmerWidget({super.key, required this.height, this.width = double.infinity});

  const ShimmerWidget.ractangular(
      {super.key, this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();
  const ShimmerWidget.circular(
      {super.key, required this.width, required this.height})
      : this.shapeBorder = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      period: const Duration(seconds: 3),
      child: Container(
        height: height,
        width: width,
        decoration:
            ShapeDecoration(color: Colors.grey[400]!, shape: shapeBorder),
      ),
    );
  }
}
