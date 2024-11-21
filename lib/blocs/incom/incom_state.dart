part of 'incom_bloc.dart';

@immutable
sealed class IncomState {}

final class IncomInitial extends IncomState {}

final class IncomLoadedState extends IncomState {
  IncomLoadedState({required this.incoms});

  final List<Incom> incoms;
}
