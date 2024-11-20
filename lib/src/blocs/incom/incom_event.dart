part of 'incom_bloc.dart';

@immutable
sealed class IncomEvent {}

class GetIncomEvent extends IncomEvent {}

class AddIncomEvent extends IncomEvent {
  AddIncomEvent({required this.incom});

  final Incom incom;
}

class EditIncomEvent extends IncomEvent {
  EditIncomEvent({required this.incom});

  final Incom incom;
}

class DeleteIncomEvent extends IncomEvent {
  DeleteIncomEvent({required this.incom});

  final Incom incom;
}
