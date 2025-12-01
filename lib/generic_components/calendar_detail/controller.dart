import 'datetime_util.dart';
import 'package:flutter/widgets.dart';

/// Advanced Calendar controller that manage selection date state.
class CalendarController extends ValueNotifier<DateTime> {
  /// Generates controller with custom date selected.
  CalendarController(super.value);

  /// Generates controller with today date selected.
  CalendarController.today() : this(DateTime.now().toZeroTime());

  @override
  set value(DateTime newValue) => super.value = newValue.toZeroTime();
}
