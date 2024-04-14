import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_watch_state.freezed.dart';

part 'stop_watch_state.g.dart';

@freezed
class StopWatchState with _$StopWatchState {
  const factory StopWatchState({
    @Default(0) int time,
    @Default(false)bool isRunning,
    @Default([]) List<String> lapTimes,
    @Default('') String formattedTime,
    @Default('') String millisecondsStr,
  }) = _StopWatchState;

  factory StopWatchState.fromJson(Map<String, Object?> json) =>
      _$StopWatchStateFromJson(json);
}

