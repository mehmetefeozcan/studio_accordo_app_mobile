import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Not a card and not a tile. The shortcut is its label, set at the tightest
/// pass, with the icon as a mark beside it. The tap plate meets 44 dp without
/// drawing a box around it.
class HomeShortcutButtonWidget extends StatelessWidget {
  final ShortCutParams params;

  const HomeShortcutButtonWidget({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: params.text,
      child: InkWell(
        onTap: () => context.push(params.path),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                params.icon,
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  context.ds.gloss,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: context.gapMicro),
              Text(
                params.text,
                style: context.pass(AppPass.four),
                maxLines: 1,
                softWrap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShortCutParams {
  final String path;
  final String icon;
  final String text;

  const ShortCutParams({
    required this.path,
    required this.icon,
    required this.text,
  });
}
