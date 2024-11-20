import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial()) {
    on<ButtonEvent>(
      (event, emit) => switch (event) {
        CheckButtonActive() => _checkButtonActive(event, emit),
        DisableButton() => _disableButton(event, emit),
      },
    );
  }

  void _checkButtonActive(
    CheckButtonActive event,
    Emitter<ButtonState> emit,
  ) {
    final isEmpty = event.controllers.any((controller) => controller.isEmpty);
    if (state is ButtonInactive && isEmpty ||
        state is ButtonInitial && !isEmpty) return;
    emit(isEmpty ? ButtonInactive() : ButtonInitial());
  }

  void _disableButton(
    DisableButton event,
    Emitter<ButtonState> emit,
  ) {
    emit(ButtonInactive());
  }
}
