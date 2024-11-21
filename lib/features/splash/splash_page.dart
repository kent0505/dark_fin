import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/incom/incom_bloc.dart';
import '../../core/utilsss.dart';
import '../../core/widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initFunc() async {
    await init().then((value) {
      if (mounted) {
        context.read<IncomBloc>().add(IncomGet());
      }

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (onboard) {
            context.go('/onboarding');
          } else {
            context.go('/home');
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initFunc();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingIndicator(),
    );
  }
}
