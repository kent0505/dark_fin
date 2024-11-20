import 'package:flutter/material.dart';

import '../../../core/config/fonts.dart';
import '../../../core/models/incom.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({
    super.key,
    required this.incom,
  });

  final Incom incom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.only(
        bottom: 8,
        left: 22,
        right: 22,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff343434),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 70),
          Column(
            children: [
              Text(
                incom.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: Fonts.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
