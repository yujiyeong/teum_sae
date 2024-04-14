import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teum_sae/stop_watch/screen/stop_watch_state.dart';

class StopWatchViewModel with ChangeNotifier {
  /// 00:00:00 00
  /// time이 0이고, form이 적용, 끝이 잘려있음
  StopWatchViewModel() {
    _timeUpdate();
  }

  /// _state 쓰기 전용
  /// state 읽기 전용
  /// copyWith()로 변경사항만 수정
  StopWatchState _state = StopWatchState();

  StopWatchState get state => _state;

  /// time++ 해주는... 메서드, state가 아님
  /// state는 화면에 직접적으로 영향을 주는 애들이다, 화면이 알아야 하는..
  /// business logic : state 값을 만들기 위한 과정, 화면과 직접적인 연관 없음
  Timer? _timer;

  /// stop watch 실행 버튼을 눌렀을 때
  /// isRunning이 true 일 때, false로 바꾸고 _start()를 실행
  /// isRunning이 false 일 때, true로 _pause()를 동작
  void clickButton() {
    /// business logic
    _state = state.copyWith(isRunning: !state.isRunning);
    notifyListeners();

    if (state.isRunning) {
      _start();
    } else {
      _pause();
      print('click button pause !!!!!!!!!!!!');
    }
  }

  void _timeUpdate({int currentTime = 0}) {
    String startFormattedTime = _formatTime(currentTime);
    String startMilliSecondsStr = startFormattedTime.split('.').last;
    _state = state.copyWith(
      time: currentTime,
      formattedTime:
          startFormattedTime.replaceAll('.$startMilliSecondsStr', ''),
      millisecondsStr: startMilliSecondsStr,
    );

    notifyListeners();
  }

  /// start()
  /// _timer 초기화
  /// 10밀리초마다 callback 함수를 호출
  /// _formatTime 에 _time을 넣어서 폼을 정해주고, 그걸 formattedTime 변수에 저장한다
  /// split을 사용해서 '.'마다 자르고, 마지막 부분 밀리초는 변수에 저장한다
  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {

      _timeUpdate(currentTime: state.time + 1);
    });
  }

  /// 중지
  /// nullable한 _timer를 취소한다.
  void _pause() {
    // _timeUpdate();
    _timer?.cancel();
  }

  /// 초기화, 리셋
  /// _isRunnig을 falser로 바꿔주고 _timer를 취소한다. 그리고 _lapTimes 리스트를 다 지우고 _time에는 다시 0을 저장한다.
  void reset() {
    _state = state.copyWith(isRunning: false, lapTimes: []);
    _timeUpdate();
    _pause();

    notifyListeners();
  }

  /// 문자열의 time을 값으로 받아서 _lapTimesd에 추가한다.
  /// 0번 인덱스에 time을 넣는다. 최근에 누른게 가장 앞쪽에 있다
  void recordLapTime(String time) {
    /// List<String> recordLapTimes = state.lapTimes;
    /// 변경 불가능한 리스트에 값을 추가하거나 수정하는 방법... 위 코드는 안되지만 .toList()로 값만 받어서 넣으믄 된다
    List<String> recordLapTimes = state.lapTimes.toList();

    recordLapTimes.insert(0, time);

    _state = state.copyWith(lapTimes: recordLapTimes);


    notifyListeners();
  }

  /// 정수형의 time을 받는다.
  /// 1000ms == 1초 == 1sec (= 1000분의 1초)
  /// time을 밀리초, 초, 분, 시로 각각 저장한다
  /// int를 문자열로 바꾸고, padLeft를 자용해 2글자로 맞춘다, 한글자면 앞에 '0'이 붙는다.
  String _formatTime(int time) {
    int milliseconds = time % 100;
    int seconds = (time ~/ 100) % 60;

    int minutes = (time ~/ (100 * 60)) % 60;

    int hours = time ~/ ((100 * 60 * 60));

    String hoursStr = (hours % 24).toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String millisecondsStr = milliseconds.toString().padLeft(2, '0');
    return '$hoursStr:$minutesStr:$secondsStr.$millisecondsStr';
  }
}
