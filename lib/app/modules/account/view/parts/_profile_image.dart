  import 'package:flutter/material.dart';

import '../../../../core/constants/_assets.dart';

Stack accountProfileImage(ColorScheme theme) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: theme.primary.withOpacity(.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              AppAssets.userPlaceholder,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // edit icon
        Positioned(
          bottom: -5,
          right: -5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.camera_alt,
                color: theme.onPrimary,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

