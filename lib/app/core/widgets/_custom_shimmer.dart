import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer(
      {super.key,
      required this.height,
      required this.width,
      required this.borderRadius});

  final double height;
  final double width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: theme.onSurface.withOpacity(.3),
      highlightColor: theme.primary,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: theme.onSurface.withOpacity(.3),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
