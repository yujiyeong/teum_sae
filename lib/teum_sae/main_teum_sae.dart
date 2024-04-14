import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teum_sae/stop_watch/screen/stop_watch_view_model.dart';
import '../router/router.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StopWatchViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
    );
  }
}
