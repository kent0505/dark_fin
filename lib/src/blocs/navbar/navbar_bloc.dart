import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarEvent>(
      (event, emit) => switch (event) {
        ChangePageEvent() => _changePage(event, emit),
      },
    );
  }

  void _changePage(
    ChangePageEvent event,
    Emitter<NavbarState> emit,
  ) {
    if (event.index == 1) emit(NavbarInitial());
    if (event.index == 2) emit(NavbarIncome());
    if (event.index == 3) emit(NavbarNews());
    if (event.index == 4) emit(NavbarQuiz());
  }
}
