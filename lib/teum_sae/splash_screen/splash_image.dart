import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(140.0),
                    child: Image.asset('assets/png/teum_sae.png'))),
                    // child: Lottie.asset('assets/lottie/neul_ssi.json'))),
          ],
        ),
      ),
    );
  }
}
