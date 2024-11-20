import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db/db.dart';
import '../../core/models/test_model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestEvent>(
      (event, emit) => switch (event) {
        GetTestEvent() => _getTest(event, emit),
        AddTestEvent() => _addTest(event, emit),
        EditTestEvent() => _editTest(event, emit),
        DeleteTestEvent() => _deleteTest(event, emit),
      },
    );
  }

  void _getTest(
    GetTestEvent event,
    Emitter<TestState> emit,
  ) async {
    await getModels();
    emit(TestLoadedState(models: modelsList));
  }

  void _addTest(
    AddTestEvent event,
    Emitter<TestState> emit,
  ) async {
    modelsList.insert(0, event.model);
    await updateModels();
    emit(TestLoadedState(models: modelsList));
  }

  void _editTest(
    EditTestEvent event,
    Emitter<TestState> emit,
  ) async {
    for (TestModel model in modelsList) {
      if (identical(model.id, event.model.id)) {
        model.title = event.model.title;
      }
    }
    await updateModels();
    emit(TestLoadedState(models: modelsList));
  }

  void _deleteTest(
    DeleteTestEvent event,
    Emitter<TestState> emit,
  ) async {
    modelsList.removeWhere((model) => identical(model, event.model));
    await updateModels();
    emit(TestLoadedState(models: modelsList));
  }
}
