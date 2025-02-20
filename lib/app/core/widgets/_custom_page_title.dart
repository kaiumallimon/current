import 'package:flutter/material.dart';

Widget customPageTitle(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
