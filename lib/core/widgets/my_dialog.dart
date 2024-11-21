import 'package:flutter/material.dart';

import '../config/fonts.dart';
import 'my_button.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    required this.title,
    this.onlyClose = false,
    required this.onYes,
  });

  final String title;
  final bool onlyClose;
  final void Function() onYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff343434),
      child: SizedBox(
        height: 150,
        width: 200,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: Fonts.w700,
              ),
            ),
            const Spacer(),
            if (onlyClose)
              _Button(
                title: 'OK',
                onPressed: onYes,
              )
            else
              Row(
                children: [
                  const SizedBox(width: 20),
                  _Button(
                    title: 'NO',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  _Button(
                    title: 'YES',
                    onPressed: () {
                      Navigator.pop(context);
                      onYes();
                    },
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      padding: 0,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: Fonts.w600,
            ),
          ),
        ],
      ),
    );
  }
}
