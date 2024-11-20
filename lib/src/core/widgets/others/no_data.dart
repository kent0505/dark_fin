import 'package:flutter/material.dart';

import '../../config/fonts.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            SizedBox(width: 32),
            Text(
              'No information on income yet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: Fonts.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
