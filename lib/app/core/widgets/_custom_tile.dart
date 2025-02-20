import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.theme,
    required this.title,
    required this.leading,
    required this.leadingColor,
    this.onTap,
  });

  final ColorScheme theme;
  final String title;
  final String leading;
  final Color leadingColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        color: theme.primary.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: SvgPicture.asset(leading,
              width: 25, height: 25, color: leadingColor),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios,
              color: theme.onSurface.withOpacity(.5), size: 15),
        ),
      ),
    );
  }
}
