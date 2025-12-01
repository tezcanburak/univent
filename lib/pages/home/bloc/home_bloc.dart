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

  HomeBloc({
    required HomeRepository homeRepository,
   // required AuthenticationRepository authenticationRepository,
  })  : _homeRepository = homeRepository,
     //   _authenticationRepository = authenticationRepository,
        super(const HomeState()) {

    on<SetSelectedDay>(_onSetSelectedDay);
  }

  DateFormat getDateFormat() => dateFormat;








  FutureOr<void> _onSetSelectedDay(SetSelectedDay event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        selectedDate: event.selectedDate,
      ),
    );
  }



}
