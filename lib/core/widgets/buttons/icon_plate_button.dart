import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A square tap plate. The direction has no circles and no radius, so the
/// target is a plate on the lifted ground rather than a filled disc.
class IconPlateButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final String? semanticLabel;

  const IconPlateButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          // 44 dp minimum target even though no fill is drawn around it.
          constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          color: context.ds.groundLift,
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                context.ds.passage,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
