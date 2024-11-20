import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'buttons/my_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          MyButton(
            onPressed: () {
              context.pop();
            },
            child: const Icon(Icons.chevron_left),
          ),
        ],
      ),
    );
  }
}
