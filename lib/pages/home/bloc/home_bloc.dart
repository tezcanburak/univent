import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:univent/models/event.dart';
import 'package:univent/pages/home/repo/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  //final AuthenticationRepository _authenticationRepository;

  static final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
  static final DateFormat dateTimeFormat = DateFormat('dd.MM.yyyy / HH.mm');

  // Static events available app-wide through HomeState
  static final List<Event> staticEvents = <Event>[
    Event(title: 'Sunglasses Party', community: 'METUBIZ', dateTimeText: '08.11.2026 / 21.00', imageAsset: 'assets/png/image_16.png', cost: '500 TL'),
    Event(
      title: "W’EQUAL’22 Conversation",
      community: 'Verimlilik Topluluğu',
      dateTimeText: '28.12.2025 / 21.00',
      imageAsset: 'assets/png/image_17.png',
      cost: 'FREE',
    ),
    Event(
      title: 'Presentation called “Piano”',
      community: 'Müzik Topluluğu',
      dateTimeText: '25.12.2025 / 21.00',
      imageAsset: 'assets/png/image_20.png',
      cost: 'FREE',
    ),
    Event(
      title: 'Sinema Söyleşileri',
      community: 'Sinema Topluluğu',
      dateTimeText: '21.12.2025 / 21.00',
      imageAsset: 'assets/png/image_27.png',
      cost: 'FREE',
    ),
    Event(
      title: 'Kitap Kritiği',
      community: 'Okuma Topluluğu',
      dateTimeText: '20.12.2025 / 21.00',
      imageAsset: 'assets/png/image_26.png',
      cost: 'FREE',
    ),
    Event(title: 'Spotlight', community: 'METUBIZ', dateTimeText: '13.12.2025 / 21.00', imageAsset: 'assets/png/image_23.png', cost: 'FREE'),
    Event(title: 'YMG+', community: 'Verimlilik Topluluğu', dateTimeText: '27.12.2025 / 21.00', imageAsset: 'assets/png/image_25.png', cost: 'FREE'),
    // Added from `data` list (titles de-duplicated) with dates randomized within Dec 2025
    Event(
      title: 'Last Call for Sunglasses Party',
      community: 'Central Bar',
      dateTimeText: '06.12.2025 / 21.00',
      imageAsset: 'assets/png/image_16.png',
      cost: '500 TL',
    ),
    Event(
      title: 'Management and Engineering Days',
      community: 'METU MM-25',
      dateTimeText: '11.12.2025 / 18.30',
      imageAsset: 'assets/png/image_22.png',
      cost: 'FREE',
    ),
    Event(
      title: 'W’EQUAL – Toplumsal Cinsiyet Eşitliği',
      community: 'KKM A Salon',
      dateTimeText: '02.12.2025 / 19.00',
      imageAsset: 'assets/png/image_24.png',
      cost: 'FREE',
    ),
    Event(
      title: 'Alternative Music Days',
      community: 'ODTÜ Mimarlık Amfisi',
      dateTimeText: '17.12.2025 / 17.30',
      imageAsset: 'assets/png/image_25.png',
      cost: '200 TL',
    ),
    Event(
      title: '“Yaprak Dökümü” Book Critics',
      community: 'METU M-06 (Math Dep.)',
      dateTimeText: '23.12.2025 / 15.00',
      imageAsset: 'assets/png/image_26.png',
      cost: 'FREE',
    ),
    Event(
      title: 'Cinema Interviews',
      community: 'ODTÜ KKM / Mimarlık Amfi',
      dateTimeText: '28.12.2025 / 20.00',
      imageAsset: 'assets/png/image_27.png',
      cost: 'FREE',
    ),
    Event(
      title: '“Bu Nasıl Sarışın” Musical',
      community: 'METU U3 Amfi (Physics)',
      dateTimeText: '09.12.2025 / 20.30',
      imageAsset: 'assets/png/image_28.png',
      cost: '150 TL',
    ),
  ];

  DateTime _parseEventDate(String dateTimeText) {
    // Ex: "08.11.2026 / 21.00"
    return dateTimeFormat.parse(dateTimeText);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<Event> _eventsForDay(DateTime day, List<Event> allEvents) {
    return allEvents.where((e) => _isSameDay(_parseEventDate(e.dateTimeText ?? ''), day)).toList();
  }

  HomeBloc({
    required HomeRepository homeRepository,
    // required AuthenticationRepository authenticationRepository,
  }) : _homeRepository = homeRepository,
       //   _authenticationRepository = authenticationRepository,
       super(const HomeState()) {
    on<LoadHomeEvents>(_onLoadHomeEvents);
    on<SetSelectedDay>(_onSetSelectedDay);

    // Load the initial static list once
    add(const LoadHomeEvents());
  }

  DateFormat getDateFormat() => dateFormat;

  FutureOr<void> _onLoadHomeEvents(LoadHomeEvents event, Emitter<HomeState> emit) {
    final selected = state.selectedDate;
    emit(state.copyWith(eventList: staticEvents, selectedDayEvents: selected == null ? const [] : _eventsForDay(selected, staticEvents)));
  }

  FutureOr<void> _onSetSelectedDay(SetSelectedDay event, Emitter<HomeState> emit) {
    final day = event.selectedDate;
    emit(state.copyWith(selectedDate: day, selectedDayEvents: _eventsForDay(day, state.eventList)));
  }
}
