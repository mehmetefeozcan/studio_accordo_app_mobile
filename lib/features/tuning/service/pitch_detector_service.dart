import 'package:studio_accordo_app_mobile/features/tuning/model/pitch_reading.dart';

abstract class PitchDetectorService {
  Stream<PitchReading?> get readings;

  Future<void> start({required double referenceHz});

  Future<void> stop();

  Future<void> dispose();
}
