part of 'test_bloc.dart';

@immutable
sealed class TestEvent {}

class GetTestEvent extends TestEvent {}

class AddTestEvent extends TestEvent {
  AddTestEvent({required this.model});

  final TestModel model;
}

class EditTestEvent extends TestEvent {
  EditTestEvent({required this.model});

  final TestModel model;
}

class DeleteTestEvent extends TestEvent {
  DeleteTestEvent({required this.model});

  final TestModel model;
}
