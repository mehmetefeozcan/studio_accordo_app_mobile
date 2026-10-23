import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

Future<T?> showGlobalBottomSheet<T>(
  Widget child, {
  bool isScrollControlled = true,
  void Function()? onClosed,
  Color? backgroundColor,
  EdgeInsets? padding,
  double? minChildSize,
  double? maxChildSize,
  double? initialChildSize,
}) async {
  final context = AppConstants.navigatorKey.currentContext;

  if (context == null) return null;

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    // The sheet is the one case where a second ground value is permitted.
    backgroundColor: backgroundColor ?? context.ds.groundSunken,
    isDismissible: true,
    // Radius 0: see design/CONSTITUTION.md §6.
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    showDragHandle: false,
    enableDrag: true,
    useSafeArea: true,
    builder: (context) {
      final keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
      final contentPadding = (padding ?? context.screenPadding).copyWith(
        top: context.gapOpen,
        bottom: keyboardPadding > 0 ? keyboardPadding + 10 : context.gapOpen,
      );

      if (minChildSize == null && maxChildSize == null) {
        return Padding(padding: contentPadding, child: child);
      }

      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize ?? minChildSize ?? 0.5,
        minChildSize: minChildSize ?? 0.25,
        maxChildSize: maxChildSize ?? 0.9,
        builder: (context, scrollController) {
          return Padding(
            padding: contentPadding,
            child: PrimaryScrollController(
              controller: scrollController,
              child: child,
            ),
          );
        },
      );
    },
  );
}
