import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectModeScreen extends StatefulWidget {
  const SelectModeScreen({super.key});

  @override
  State<SelectModeScreen> createState() => _SelectModeScreenState();
}

class _SelectModeScreenState extends State<SelectModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.push('/info');
            },
            icon: const Icon(Icons.info_outline),
            color: Colors.greenAccent,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 40.0,
                crossAxisSpacing: 24.0,
                padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 40.0),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.push('/stopWatch');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.0),
                        ),
                        elevation: 1,
                        backgroundColor: Colors.greenAccent),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/png/alarm.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      context.push('/nowTime');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      textStyle: const TextStyle(fontSize: 16.0),
                      elevation: 0.1,
                    ),
                    child: Image.asset(
                      'assets/png/clock.png',
                      color: Colors.greenAccent,
                    ),
                  ),
                  // Container(
                  //   height: 44.0,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(40.0),
                  //       gradient: LinearGradient(colors: [
                  //         Color.fromARGB(255, 2, 173, 102),
                  //         Colors.yellow.shade200
                  //       ])),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(40.0),
                  //         ),
                  //         backgroundColor: Colors.transparent,
                  //         shadowColor: Colors.transparent),
                  //     child: Text('Elevated Button'),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
