import 'package:flutter/material.dart';

import '../../../../data/models/home/_category_model.dart';

InkWell buildHomeCategories(List<CategoryModel> categories, int index,
      ColorScheme theme, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(categories[index].title),
        elevation: 8,
        shadowColor: theme.onSurface.withOpacity(.2),
        side: BorderSide(
          color: theme.primary.withOpacity(.2),
        ),
      ),
    );
  }