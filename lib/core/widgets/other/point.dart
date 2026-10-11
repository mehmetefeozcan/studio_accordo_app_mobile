import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';

import 'package:flutter/material.dart';

class Point extends StatelessWidget {
  final double size;
  final Color? color;
  const new({super.key, this.size = 16, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color ?? context.ds.actionBg),
    );
  }
}
