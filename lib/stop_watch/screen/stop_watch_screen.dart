import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:teum_sae/stop_watch/screen/stop_watch_view_model.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  @override
  void initState() {
    print('init');

    super.initState();
  }

  // // time++ 해주는... 메서드, state가 아님
  // // state는 화면에 직접적으로 영향을 주는 애들이다, 화면이 알아야 하는..
  // // business logic : state 값을 만들기 위한 과정, 화면과 직접적인 연관 없음
  // Timer? _timer;
  //
  // // state
  // int _time = 0;
  //
  // // state
  // bool _isRunning = false;
  //
  // // state
  // final List<String> _lapTimes = [];
  //
  // void _clickButton() {
  //   setState(() {
  //     /// business logic
  //     _isRunning = !_isRunning;
  //     if (_isRunning) {
  //       _start();
  //     } else {
  //       _pause();
  //     }
  //   });
  // }
  //
  // void _start() {
  //   _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
  //     print('duration');
  //     setState(() {
  //       _time++;
  //       // String formattedTime = _formatTime(_time);
  //       // String millisecondsStr = formattedTime.split('.').last;
  //     });
  //   });
  // }
  //
  // void _pause() {
  //   _timer?.cancel();
  // }
  //
  // void _reset() {
  //   setState(() {
  //     _isRunning = false;
  //     _pause();
  //     _lapTimes.clear();
  //     _time = 0;
  //   });
  // }
  //
  // void _recordLapTime(String time) {
  //   _lapTimes.insert(0, time);
  // }
  //
  // String _formatTime(int time) {
  //   int milliseconds = time % 100;
  //   int seconds = (time ~/ 100) % 60;
  //   int minutes = (time ~/ (100 * 60)) % 60;
  //   int hours = time ~/ (100 * 60 * 60);
  //
  //   String hoursStr = (hours % 24).toString().padLeft(2, '0');
  //   String minutesStr = minutes.toString().padLeft(2, '0');
  //   String secondsStr = seconds.toString().padLeft(2, '0');
  //   String millisecondsStr = milliseconds.toString().padLeft(2, '0');
  //
  //   return '$hoursStr:$minutesStr:$secondsStr.$millisecondsStr';
  // }

  @override
  void dispose() {
    // _pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // watch는 지속적인 관찰을 하고 변경시 rebuild 한다.
    final model = context.watch<StopWatchViewModel>();
    // String formattedTime = _formatTime(_time);
    // String millisecondsStr = formattedTime.split('.').last;

    
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              // alignment: Alignment.center,
              children: [
                Center(
                  // child: Lottie.asset('assets/lottie/flow.json'),
                  child: Lottie.asset(
                    model.state.isRunning
                    // _isRunning
                        ? 'assets/lottie/flow.json'
                        : 'assets/lottie/flow.json',
                    repeat: model.state.isRunning,
                    animate: model.state.isRunning,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.state.formattedTime,
                        // formattedTime.replaceAll('.$millisecondsStr', ''),
                        style: const TextStyle(fontSize: 64.0),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        model.state.millisecondsStr,
                        // millisecondsStr,
                        style:
                            const TextStyle(fontSize: 32.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: IconButton(
                      onPressed: () {
                        context.go('/selectMode');
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 80.0,
            child: ListView(
              children: model.state.lapTimes
                  .map((time) => Center(
                        child: Text(
                          time,
                          style: const TextStyle(
                              fontFamily: 'Pretendard',
                              // fontSize: 16.0,
                              color: Colors.grey),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding:
                // const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
                const EdgeInsets.fromLTRB(16.0, 32, 16.0, 56.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.greenAccent,
                  onPressed: model.reset,
                  child: const Icon(Icons.refresh, color: Colors.white),
                ),
                FloatingActionButton(
                  // 보통 한 화면에 하나만 사용한다.. 에러 나면 히로태그..
                  heroTag: null,
                  backgroundColor: Colors.white,
                  onPressed: model.clickButton,
                  child: model.state.isRunning
                      ? const Icon(Icons.pause, color: Colors.greenAccent)
                      : const Icon(Icons.play_arrow, color: Colors.greenAccent),
                ),
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.greenAccent,
                  onPressed: () {
                    model.recordLapTime('${model.state.formattedTime}.${model.state.millisecondsStr}');
                  },
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
