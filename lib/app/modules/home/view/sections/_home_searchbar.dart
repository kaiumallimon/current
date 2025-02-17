import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/_assets.dart';
import '../../../../core/constants/_sizes.dart';

Widget buildSearchBar(ColorScheme theme) {
  return Container(
    height: AppSize.inputHeight,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: theme.surface,
      boxShadow: [
        BoxShadow(
          color: theme.primary.withOpacity(.1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 0),
        )
      ],
    ),
    child: Row(
      spacing: 8,
      children: [
        SvgPicture.asset(
          AppAssets.search,
          color: theme.onSurface.withOpacity(.5),
          width: 25,
          height: 25,
        ),
        Text(
          'Search',
          style: TextStyle(color: theme.onSurface.withOpacity(.5)),
        ),
      ],
    ),
  );
}