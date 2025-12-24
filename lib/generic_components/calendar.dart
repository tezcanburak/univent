import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/pages/home/bloc/home_bloc.dart';

import 'calendar_detail/calendar_widget.dart';
import 'calendar_detail/controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _calendarControllerToday = CalendarController.today();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(hintColor: Colors.white);
    var homeBloc = context.read<HomeBloc>();
    final createdDates = homeBloc.state.eventList.map((e) => HomeBloc.dateTimeFormat.parse(e.dateTimeText!)).toList();
    print(createdDates);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var selectedDate = homeBloc.state.selectedDate;
        return Theme(
          data: theme.copyWith(
            textTheme: theme.textTheme.copyWith(
              titleMedium: theme.textTheme.titleMedium!.copyWith(fontSize: 20, color: Colors.white),
              bodyLarge: theme.textTheme.bodyLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.w300),
              bodyMedium: theme.textTheme.bodyMedium!.copyWith(fontSize: 12),
            ),
            primaryColor: ColorConstants.lightGrey,
            highlightColor: Colors.white.withValues(alpha: 0.1),
            disabledColor: Colors.white.withValues(alpha: 0.5),
          ),
          child: CalendarWidget(
            controller: selectedDate != null ? CalendarController(selectedDate) : _calendarControllerToday,
            events: createdDates,
            weekLineHeight: 52.0,
            startWeekDay: 1,
            innerDot: true,
            keepLineSize: true,
            calendarTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1, letterSpacing: 0),
          ),
        );
      },
    );
  }
}
