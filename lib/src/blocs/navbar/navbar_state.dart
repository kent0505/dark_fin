part of 'navbar_bloc.dart';

@immutable
sealed class NavbarState {}

final class NavbarInitial extends NavbarState {}

final class NavbarIncome extends NavbarState {}

final class NavbarNews extends NavbarState {}

final class NavbarQuiz extends NavbarState {}
