import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../config/fonts.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.horizontalPadding = 0,
    required this.onPressed,
  });

  final String title;
  final double horizontalPadding;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 48,
          margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
          decoration: BoxDecoration(
            color: state is ButtonInitial
                ? const Color(0xffFEDB35)
                : const Color(0xffCACACA),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff2C64E3).withOpacity(0.5),
                blurRadius: 23,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CupertinoButton(
            onPressed: state is ButtonInitial ? onPressed : null,
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: Fonts.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
