import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50,
          width: width,
          decoration: BoxDecoration(
            color:
                state is ButtonInitial ? Colors.greenAccent : Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: CupertinoButton(
            onPressed: state is ButtonInitial ? onPressed : null,
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
                // fontSize: 16,
                // color: state is ButtonInitial
                //     ? Colors.white
                //     : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        );
      },
    );
  }
}
