import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/model/homework_item.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/index.dart';

import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

/// Pass 3 — the first place the direction's accent belongs, because homework
/// carries a tempo target. The target is the only thing on this screen
/// allowed to use `tempo`.
class HomeHomeworkWidget extends StatelessWidget {
  final HomeworkItem item;

  const HomeHomeworkWidget({super.key, required this.item});

  String barRange(BuildContext context) {
    if (!item.hasBarRange) return "";

    return "${context.l10n.bars} ${item.minBar}–${item.maxBar}";
  }

  String parseDeliveryDate() {
    final delivery = item.delivery;

    if (delivery == null) return "";

    final moment = Moment(delivery);
    final isSameWeek = moment.isSameLocalWeekAs(DateTime.now());

    return moment.format(isSameWeek ? "dddd" : "dddd, DD MMMM", true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                context.l10n.homework,
                style: context
                    .gloss(AppPass.two)
                    .copyWith(color: context.ds.gloss),
              ),
            ),
            Semantics(
              button: true,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(context.gapMicro),
                  child: Text(
                    context.l10n.all,
                    style: context.gloss(AppPass.four),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: context.gapMicro),
        SizedBox(
          width: context.measureOf(AppPass.three),
          child: Text(item.pieceName, style: context.pass(AppPass.three)),
        ),
        SizedBox(height: context.gapMicro),
        buildTarget(context),
        SizedBox(height: context.gapClose),
        SizedBox(
          width: context.measureOf(AppPass.three),
          child: LinearIndicator(progress: item.progress, isTempo: true),
        ),
        SizedBox(height: context.gapTight),
        buildFoot(context),
      ],
    );
  }

  /// `tempo` renders at pass 3 size here, which clears its contrast boundary.
  Widget buildTarget(BuildContext context) {
    final bpm = item.bpm;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        if (bpm != null)
          Text(
            context.l10n.targetBPM(bpm),
            style: context
                .measured(AppPass.three)
                .copyWith(color: context.tempoFor(AppPass.three)),
          ),
        if (bpm != null && item.hasBarRange) SizedBox(width: context.gapMicro),
        if (item.hasBarRange)
          Text(
            barRange(context),
            style: context
                .measuredGloss(AppPass.three)
                .copyWith(color: context.ds.gloss),
          ),
      ],
    );
  }

  Widget buildFoot(BuildContext context) {
    return SizedBox(
      width: context.measureOf(AppPass.two),
      child: Row(
        children: [
          Text(
            "${item.lastWorkingBpm ?? '—'} / ${item.bpm ?? '—'} BPM",
            // Below pass 3, tempo steps down to its higher-contrast variant.
            style: context
                .measuredGloss(AppPass.four)
                .copyWith(color: context.ds.tempoQuiet),
          ),
          SizedBox(width: context.gapMicro),
          Expanded(
            child: Text(
              "${context.l10n.delivery}: ${parseDeliveryDate()}",
              style: context
                  .measuredGloss(AppPass.four)
                  .copyWith(color: context.ds.gloss),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
