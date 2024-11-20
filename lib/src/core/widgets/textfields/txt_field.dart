import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/fonts.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onlyNumber = false,
    this.horizontalPadding = 0,
    this.length = 20,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool onlyNumber;
  final double horizontalPadding;
  final int length;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: const Color(0xff343434),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: onlyNumber ? TextInputType.number : null,
        inputFormatters: [
          LengthLimitingTextInputFormatter(length),
          if (onlyNumber) FilteringTextInputFormatter.digitsOnly,
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: Fonts.w400,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontFamily: Fonts.w400,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}
