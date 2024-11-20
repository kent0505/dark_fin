import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db/db.dart';
import '../../core/models/incom.dart';

part 'incom_event.dart';
part 'incom_state.dart';

class IncomBloc extends Bloc<IncomEvent, IncomState> {
  IncomBloc() : super(IncomInitial()) {
    on<IncomEvent>(
      (event, emit) => switch (event) {
        GetIncomEvent() => _getIncom(event, emit),
        AddIncomEvent() => _addIncom(event, emit),
        EditIncomEvent() => _editIncom(event, emit),
        DeleteIncomEvent() => _deleteIncom(event, emit),
      },
    );
  }

  void _getIncom(
    GetIncomEvent event,
    Emitter<IncomState> emit,
  ) async {
    await getIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }

  void _addIncom(
    AddIncomEvent event,
    Emitter<IncomState> emit,
  ) async {
    incomsList.insert(0, event.incom);
    await updateIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }

  void _editIncom(
    EditIncomEvent event,
    Emitter<IncomState> emit,
  ) async {
    for (Incom incom in incomsList) {
      if (identical(incom.id, event.incom.id)) {
        incom.title = event.incom.title;
      }
    }
    await updateIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }

  void _deleteIncom(
    DeleteIncomEvent event,
    Emitter<IncomState> emit,
  ) async {
    incomsList.removeWhere((model) => identical(model, event.incom));
    await updateIncoms();
    emit(IncomLoadedState(incoms: incomsList));
  }
}
