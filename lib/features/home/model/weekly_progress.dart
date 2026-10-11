class WeeklyProgress {
  final int minutes;
  final int goalMinutes;

  final int diffMinutes;

  final double metronomeHours;

  const WeeklyProgress({
    required this.minutes,
    required this.goalMinutes,
    required this.diffMinutes,
    required this.metronomeHours,
  });

  int get hours => minutes ~/ 60;
  int get remainingMinutes => minutes % 60;

  int get goalHours => goalMinutes ~/ 60;

  double get progress {
    if (goalMinutes <= 0) return 0;

    return (minutes / goalMinutes * 100).clamp(0, 100);
  }
}
