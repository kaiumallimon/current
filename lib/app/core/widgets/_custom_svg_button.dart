import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgButton extends StatelessWidget {
  const CustomSvgButton({super.key,required this.text,
  required this.color,
  required this.textColor,
  required this.asset,
  required this.onPressed});


  final String text;
  final Color color;
  final Color textColor;
  final String asset;
  final Function() onPressed;

  

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: InkWell(
      onTap: onPressed,
      mouseCursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(.1),
          //     blurRadius: 100,
          //     offset: const Offset(0, 2),
          //   )
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              asset,
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 8),
            Text(text),
          ],
        ),
      ),
    ),
  );
  }
}