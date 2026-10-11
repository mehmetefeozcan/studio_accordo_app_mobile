class HomeworkItem {
  final String pieceName;
  final int? minBar;
  final int? maxBar;

  final int? bpm;

  final int? lastWorkingBpm;

  final DateTime? delivery;

  final double progress;

  const HomeworkItem({
    required this.pieceName,
    this.minBar,
    this.maxBar,
    this.bpm,
    this.lastWorkingBpm,
    this.delivery,
    this.progress = 0,
  });

  bool get hasBarRange => minBar != null && maxBar != null;
}
