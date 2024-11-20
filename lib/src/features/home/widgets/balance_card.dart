import 'package:flutter/material.dart';

import '../../../core/config/fonts.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: const Color(0xff343434),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18),
          Text(
            '\$ ${1000}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: Fonts.w600,
            ),
          ),
          Text(
            'USD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: Fonts.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Button(
                title: 'Add',
              ),
              _Button(
                title: 'Exchange',
              ),
              _Button(
                title: 'More',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff404040),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontFamily: Fonts.w500,
          ),
        ),
      ],
    );
  }
}
