import 'package:blur/blur.dart';
import 'package:current/app/core/constants/_assets.dart';
import 'package:current/app/core/constants/_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingSide, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            buildSearchBar(theme),
          ],
        ),
      ),
    );
  }
}

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
