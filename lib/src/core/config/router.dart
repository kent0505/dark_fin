import 'package:go_router/go_router.dart';

import '../../features/home/pages/exchange_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/income/pages/income_edit_page.dart';
import '../../features/news/pages/news_read_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/incom.dart';
import '../models/news.dart';

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
    GoRoute(
      path: '/exchange',
      builder: (context, state) => const ExchangePage(),
    ),
    GoRoute(
      path: '/news_read',
      builder: (context, state) => NewsReadPage(
        news: state.extra as News,
      ),
    ),
  ],
);
