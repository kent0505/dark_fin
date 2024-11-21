import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/pop_button.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getStatusBar(context, height: 6)),
          Row(
            children: [
              const SizedBox(width: 22),
              PopButton(
                title: 'Back',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
