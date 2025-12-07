import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univent/generic_components/calendar.dart';
import 'package:univent/pages/home/bloc/home_bloc.dart';

class CalendarForm extends StatelessWidget {
  const CalendarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [Calendar(),],),
          ),
        );
      },
    );
  }
}
