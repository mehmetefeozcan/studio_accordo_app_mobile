import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/model/greeting_kind.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:moment_dart/moment_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Pass 1: the greeting is the loosest thing on the screen, with the date as
/// its gloss. Sentence case — the date is never uppercased, which also keeps
/// Turkish month names and the dotted i intact.
class HomeAppbarWidget extends StatelessWidget {
  final GreetingKind greeting;

  const HomeAppbarWidget({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting.label(context), style: context.pass(AppPass.one)),
              SizedBox(height: context.gapMicro),
              Text(
                Moment.now().format("dddd, DD MMMM", true),
                style: context
                    .gloss(AppPass.one)
                    .copyWith(color: context.ds.gloss),
              ),
            ],
          ),
        ),
        Semantics(
          button: true,
          label: context.l10n.profile,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(context.gapMicro),
              child: SvgPicture.asset(
                AppAssets.icons.settings,
                width: 22,
                height: 22,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  context.ds.gloss,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
