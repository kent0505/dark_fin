import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../config/fonts.dart';
import '../buttons/my_button.dart';
import '../others/svg_widget.dart';

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
      child: Stack(
        children: [
          Positioned(
            top: 9,
            left: 16,
            child: Text(
              hintText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: Fonts.w300,
              ),
            ),
          ),
          TextField(
            controller: controller,
            keyboardType: onlyNumber ? TextInputType.number : null,
            inputFormatters: [
              LengthLimitingTextInputFormatter(length),
              if (onlyNumber) FilteringTextInputFormatter.digitsOnly,
            ],
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: Fonts.w500,
              fontSize: 17,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ).copyWith(top: 30),
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: (value) {
              onChanged();
            },
          ),
          Positioned(
            top: 18,
            right: 18,
            child: BlocBuilder<ButtonBloc, ButtonState>(
              builder: (context, state) {
                return MyButton(
                  onPressed: controller.text.isEmpty
                      ? null
                      : () {
                          controller.clear();
                          onChanged();
                        },
                  minSize: 18,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.text.isEmpty
                          ? const Color(0xffB8BBBE)
                          : Colors.black,
                    ),
                    child: const Center(
                      child: SvgWidget('assets/clear.svg'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
