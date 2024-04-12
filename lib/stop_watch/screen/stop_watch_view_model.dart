import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchViewModel with ChangeNotifier {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;
  final List<String> _lapTimes = [];

  int get time => _time;

  bool get isRunning => _isRunning;

  List<String> get lapTimes => _lapTimes;

  void startStop() {
    _isRunning = !_isRunning;

    _isRunning ? _start() : _pause();

    notifyListeners();
  }

  void reset() {
    _isRunning = false;
    _pause();
    _lapTimes.clear();
    _time = 0;
    notifyListeners();
  }

  void recordLapTime() {
    final sec = _time ~/ 100;
    final hundredth = '${_time % 100}'.padLeft(2, '0');
    _lapTimes.insert(0, '${_lapTimes.length + 1}등 $sec.$hundredth');
    notifyListeners();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      _time++;
      notifyListeners();
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
