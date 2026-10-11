import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:flutter/material.dart';

import 'button_metrics.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonSize size;
  final AppButtonTone tone;
  final bool expand;
  final double? radius;
  final EdgeInsets? padding;
  final Color? color;
  final double? borderWidth;
  final Color? splashColor;
  final Widget? icon;

  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.size = AppButtonSize.md,
    this.tone = AppButtonTone.normal,
    this.expand = false,
    this.radius,
    this.padding,
    this.color,
    this.borderWidth,
    this.splashColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final ds = context.ds;

    final danger = tone == AppButtonTone.danger;
    final signalOff = ds.signalOff;

    final strokeColor = color ?? (danger ? signalOff : ds.lineControl);
    final labelColor = color ?? (danger ? signalOff : ds.textPrimary);

    final button = OutlinedButton(
      onPressed: onPressed,
      style:
          OutlinedButton.styleFrom(
            foregroundColor: labelColor,
            disabledForegroundColor: ds.textSecondary,
            overlayColor: splashColor,
            side: BorderSide(color: strokeColor, width: borderWidth ?? 1),
            minimumSize: Size(0, size.minHeight),
            padding: padding ?? size.padding,
            textStyle: size.textStyle,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith((states) {
              final c = states.contains(WidgetState.disabled)
                  ? ds.lineSeparator
                  : strokeColor;
              return BorderSide(color: c, width: borderWidth ?? 1);
            }),
          ),
      child: icon == null
          ? child
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconTheme.merge(
                  data: const IconThemeData(size: 20),
                  child: icon!,
                ),
                const SizedBox(width: 8),
                child,
              ],
            ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
