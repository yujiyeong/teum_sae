import 'package:go_router/go_router.dart';
import 'package:teum_sae/now_time/now_time_screen.dart';
import 'package:teum_sae/stop_watch/screen/stop_watch_screen.dart';
import 'package:teum_sae/teum_sae/presentation/teum_sae_screen/info_screen.dart';
import 'package:teum_sae/teum_sae/presentation/teum_sae_screen/select_mode_screen.dart';
import 'package:teum_sae/teum_sae/splash_screen/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/selectMode',
      builder: (context, state) {
        return const SelectModeScreen();
      },
    ),
    GoRoute(
      path: '/info',
      builder: (context, state) {
        return const InfoScreen();
      },
    ),
    GoRoute(
      path: '/stopWatch',
      builder: (context, state) {
        return const StopWatchScreen();
      },
    ),
    GoRoute(
      path: '/nowTime',
      builder: (context, state) {
        return const NowTimeScreen();
      },
    ),
  ],
);
