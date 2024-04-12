import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'splash_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Timer(const Duration(seconds: 1), () {
      context.go('/selectMode');
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashImage();
  }
}
