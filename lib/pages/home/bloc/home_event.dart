part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class SetSelectedDay extends HomeEvent {
  final DateTime selectedDate;

  const SetSelectedDay(this.selectedDate);
}

class LoadHomeEvents extends HomeEvent {
  const LoadHomeEvents();
}
