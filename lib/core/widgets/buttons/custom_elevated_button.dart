import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:flutter/material.dart';

import 'button_metrics.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonSize size;
  final bool expand;
  final bool isLoading;
  final String? loadingLabel;
  final EdgeInsets? padding;
  final Color? color;
  final Color? foregroundColor;
  final Color? disabledColor;
  final Color? splashColor;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.size = AppButtonSize.md,
    this.expand = false,
    this.isLoading = false,
    this.loadingLabel,
    this.padding,
    this.color,
    this.foregroundColor,
    this.disabledColor,
    this.splashColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final ds = context.ds;
    final disabled = onPressed == null || isLoading;

    final label = isLoading && loadingLabel != null
        ? Text(loadingLabel!)
        : child;

    final button = FilledButton(
      onPressed: disabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color ?? ds.passage,
        foregroundColor: foregroundColor ?? ds.ground,
        disabledBackgroundColor: disabledColor ?? ds.groundLift,
        disabledForegroundColor: ds.gloss,
        overlayColor: splashColor,
        minimumSize: Size(0, size.minHeight),
        padding: padding ?? size.padding,
        textStyle: size.textStyle,
        elevation: 0,
        shadowColor: Colors.transparent,
        // Radius 0: see design/CONSTITUTION.md §6.
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: icon == null
          ? label
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconTheme.merge(
                  data: const IconThemeData(size: 20),
                  child: icon!,
                ),
                const SizedBox(width: 8),
                label,
              ],
            ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
