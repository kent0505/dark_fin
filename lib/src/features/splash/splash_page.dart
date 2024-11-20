import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/incom/incom_bloc.dart';
import '../../core/db/db.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/others/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    await initDB().then((value) {
      if (mounted) context.read<IncomBloc>().add(IncomGet());

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (onboard) {
            // context.go('/onboard');
            context.go('/home');
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
    load();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
