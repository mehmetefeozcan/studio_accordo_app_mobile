import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconCircleButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;

  const IconCircleButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.ds.bgSunken,
        ),
        padding: EdgeInsets.all(context.space4),
        child: Center(
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              context.ds.textPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
