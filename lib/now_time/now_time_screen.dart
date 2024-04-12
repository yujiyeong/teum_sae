import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class NowTimeScreen extends StatefulWidget {
  const NowTimeScreen({super.key});

  @override
  State<NowTimeScreen> createState() => _NowTimeScreenState();
}

class _NowTimeScreenState extends State<NowTimeScreen> {
  late DateTime _nowTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _nowTime = DateTime.now();

    // 매 초마다 현재 시간을 업데이트
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _nowTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            children: [
              Center(
                  child: Container(
                child: Lottie.asset(
                  'assets/lottie/background_color2.json',
                  // 'assets/lottie/back.json',
                  width: 1000,
                  height: 1000,
                  fit: BoxFit.fill,
                ),
              )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_nowTime.year}/${_nowTime.month}/${_nowTime.day}',
                      style: TextStyle(
                        fontFamily: 'RubikBubbles',
                        fontSize: 24,
                        color: Colors.pinkAccent.shade100,
                      ),
                    ),
                    Text(
                      '${_nowTime.hour.toString().padLeft(2, '0')}:${_nowTime.minute.toString().padLeft(2, '0')}:${_nowTime.second.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontFamily: 'RubikBubbles',
                        fontSize: 72.0,
                        color: Colors.pinkAccent.shade100,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    )
                  ],
                ),
              ),
              SafeArea(
                  child: IconButton(
                      onPressed: () {
                        context.go('/selectMode');
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)))
            ],
          ),
          Stack(
            children: [
              Center(
                  child: Lottie.asset(
                'assets/lottie/background_color.json',
                // 'assets/lottie/back.json',
                height: 1000,
                width: 1000,
                fit: BoxFit.fill,
              )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_nowTime.year}/${_nowTime.month}/${_nowTime.day}',
                      style: const TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${_nowTime.hour.toString().padLeft(2, '0')}:${_nowTime.minute.toString().padLeft(2, '0')}:${_nowTime.second.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 72.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    )
                  ],
                ),
              ),
              SafeArea(
                child: IconButton(
                    onPressed: () {
                      context.pop('/selectMode');
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
            ],
          ),
          Stack(
            children: [
              Center(
                  child: Container(
                child: Lottie.asset(
                  'assets/lottie/background_color4.json',
                  height: 1000,
                  width: 1000,
                  fit: BoxFit.fill,
                ),
              )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_nowTime.year}/${_nowTime.month}/${_nowTime.day}',
                      style: const TextStyle(
                        fontFamily: 'Anta',
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${_nowTime.hour.toString().padLeft(2, '0')}:${_nowTime.minute.toString().padLeft(2, '0')}:${_nowTime.second.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontFamily: 'Anta',
                        fontSize: 72.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    )
                  ],
                ),
              ),
              SafeArea(
                  child: IconButton(
                      onPressed: () {
                        context.pop('/selectMode');
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)))
            ],
          ),
        ],
      ),
    );
  }
}
