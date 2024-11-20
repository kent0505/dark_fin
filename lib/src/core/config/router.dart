import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/income/pages/income_edit_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/incom.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/income_edit',
      builder: (context, state) => IncomeEditPage(
        incom: state.extra as Incom,
      ),
    ),
  ],
);
