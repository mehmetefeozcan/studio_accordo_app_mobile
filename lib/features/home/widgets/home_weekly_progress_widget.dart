import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/model/weekly_progress.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/index.dart';

import 'package:flutter/material.dart';

/// Pass 2. No card: the week is grouped by its gaps and by sitting on the
/// shared indent, not by a container. The meter is one of the two lines the
/// direction permits, because the value is read positionally.
class HomeWeeklyProgressWidget extends StatelessWidget {
  final WeeklyProgress progress;

  const HomeWeeklyProgressWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.thisWeek,
          style: context.gloss(AppPass.two).copyWith(color: context.ds.gloss),
        ),
        SizedBox(height: context.gapMicro),
        buildTime(context),
        SizedBox(height: context.gapClose),
        SizedBox(
          width: context.measureOf(AppPass.two),
          child: LinearIndicator(progress: progress.progress),
        ),
        SizedBox(height: context.gapTight),
        buildDiff(context),
      ],
    );
  }

  Widget buildTime(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: progress.hours.toString(),
                style: context.measured(AppPass.two),
              ),
              TextSpan(
                text: " ${context.l10n.h} ",
                style: context
                    .gloss(AppPass.three)
                    .copyWith(color: context.ds.gloss),
              ),
              TextSpan(
                text: progress.remainingMinutes.toString(),
                style: context.measured(AppPass.two),
              ),
              TextSpan(
                text: " ${context.l10n.min}",
                style: context
                    .gloss(AppPass.three)
                    .copyWith(color: context.ds.gloss),
              ),
            ],
          ),
        ),
        SizedBox(width: context.gapMicro),
        Text(
          context.l10n.goalPractiseHour(progress.goalHours),
          style: context
              .measuredGloss(AppPass.four)
              .copyWith(color: context.ds.gloss),
        ),
      ],
    );
  }

  Widget buildDiff(BuildContext context) {
    final diff = progress.diffMinutes;
    final sign = diff >= 0 ? "+" : "−";

    return SizedBox(
      width: context.measureOf(AppPass.three),
      child: Text.rich(
        TextSpan(
          style: context
              .measuredGloss(AppPass.four)
              .copyWith(color: context.ds.gloss),
          children: [
            TextSpan(text: context.l10n.comparedToLastWeek),
            // The direction has no success/failure colour. More or less
            // practice is carried by weight and the sign, on one ink.
            TextSpan(
              text: " $sign${diff.abs()} ${context.l10n.min}",
              style: context
                  .measured(AppPass.four)
                  .copyWith(
                    color: context.ds.passage,
                    fontSize: context.gloss(AppPass.four).fontSize,
                  ),
            ),
            TextSpan(
              text:
                  " · ${progress.metronomeHours} "
                  "${context.l10n.theClockWithMetronome}",
            ),
          ],
        ),
      ),
    );
  }
}
