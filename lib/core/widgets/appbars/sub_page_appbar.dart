import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

/// The title opens at pass 2 and is aligned to the shared left indent, so a
/// sub page starts on the same axis as everything under it.
class SubPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? backRoute;
  final List<Widget>? actions;

  const SubPageAppbar({
    super.key,
    required this.title,
    this.backRoute,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leadingWidth: context.indent + 36,
      title: Text(
        title,
        style: context.pass(AppPass.two).copyWith(color: context.ds.passage),
      ),
      actions: actions,
      leading: Semantics(
        button: true,
        label: MaterialLocalizations.of(context).backButtonTooltip,
        child: InkWell(
          onTap: () => context.backOrGo(backRoute, replace: true),
          child: Padding(
            padding: EdgeInsets.only(left: context.indent),
            child: Transform.flip(
              flipX: true,
              child: SvgPicture.asset(
                AppAssets.icons.chevron,
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  context.ds.passage,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
