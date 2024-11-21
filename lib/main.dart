import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/blocs/button/button_bloc.dart';
import 'src/blocs/navbar/navbar_bloc.dart';
import 'src/blocs/incom/incom_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/onboarding.png'), context);
    precacheImage(const AssetImage('assets/onboarding2.png'), context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ButtonBloc()),
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => IncomBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
