part of 'home_bloc.dart';

class HomeState extends Equatable {
  final DateTime? selectedDate;
  final List<Event> eventList;

  const HomeState({this.selectedDate, this.eventList = const []});

  HomeState copyWith({DateTime? selectedDate,List<Event>? eventList}) {
    return HomeState(selectedDate: selectedDate ?? this.selectedDate, eventList: eventList ?? this.eventList);
  }

  @override
  List<Object?> get props => [selectedDate, eventList];
}
