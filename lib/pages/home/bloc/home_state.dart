part of 'home_bloc.dart';

class HomeState extends Equatable {
  final DateTime? selectedDate;
  final List<Event> selectedDayEvents;
  final List<Event> eventList;

  static const Object _unset = Object();

  const HomeState({this.selectedDate, this.selectedDayEvents = const [], this.eventList = const []});

  HomeState copyWith({Object? selectedDate = _unset, List<Event>? selectedDayEvents, List<Event>? eventList}) {
    return HomeState(
      selectedDate: identical(selectedDate, _unset) ? this.selectedDate : selectedDate as DateTime?,
      selectedDayEvents: selectedDayEvents ?? this.selectedDayEvents,
      eventList: eventList ?? this.eventList,
    );
  }

  @override
  List<Object?> get props => [selectedDate, selectedDayEvents, eventList];
}
