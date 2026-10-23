import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/model/practice_entry.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/extension/date_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

/// Pass 4 — the tightest thing on the screen, and the last. No card, no
/// chevron plate: the whole row is the target.
class HomeLastPracticedWidget extends StatelessWidget {
  final PracticeEntry entry;

  const HomeLastPracticedWidget({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.lastPracticed,
          style: context.gloss(AppPass.two).copyWith(color: context.ds.gloss),
        ),
        SizedBox(height: context.gapMicro),
        Semantics(
          button: true,
          child: InkWell(
            onTap: () {},
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 44),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          entry.pieceName,
                          style: context.pass(AppPass.four),
                        ),
                        Text(
                          "${entry.date.relative(context)} · "
                          "%${entry.accuracy} ${context.l10n.accuracy}",
                          style: context
                              .measuredGloss(AppPass.four)
                              .copyWith(color: context.ds.gloss),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    AppAssets.icons.chevron,
                    width: 18,
                    height: 18,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      context.ds.gloss,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
