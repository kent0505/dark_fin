part of 'test_bloc.dart';

@immutable
sealed class TestState {}

final class TestInitial extends TestState {}

final class TestLoadedState extends TestState {
  TestLoadedState({required this.models});

  final List<TestModel> models;
}
