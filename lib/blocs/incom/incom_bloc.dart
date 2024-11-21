import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/incom.dart';
import '../../core/utils.dart';

part 'incom_event.dart';
part 'incom_state.dart';

class IncomBloc extends Bloc<IncomEvent, IncomState> {
  IncomBloc() : super(IncomInitial()) {
    on<IncomEvent>(
      (event, emit) => switch (event) {
        IncomGet() => _getIncom(event, emit),
        IncomAdd() => _addIncom(event, emit),
        IncomEdit() => _editIncom(event, emit),
        IncomDelete() => _deleteIncom(event, emit),
      },
    );
  }

  void _getIncom(
    IncomGet event,
    Emitter<IncomState> emit,
  ) async {
    await getIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }

  void _addIncom(
    IncomAdd event,
    Emitter<IncomState> emit,
  ) async {
    incomsList.insert(0, event.incom);
    await updateIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }

  void _editIncom(
    IncomEdit event,
    Emitter<IncomState> emit,
  ) async {
    for (Incom incom in incomsList) {
      if (identical(incom.id, event.incom.id)) {
        incom.category = event.incom.category;
        incom.title = event.incom.title;
        incom.amount = event.incom.amount;
      }
    }
    await updateIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }

  void _deleteIncom(
    IncomDelete event,
    Emitter<IncomState> emit,
  ) async {
    incomsList.removeWhere((model) => identical(model, event.incom));
    await updateIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }
}
