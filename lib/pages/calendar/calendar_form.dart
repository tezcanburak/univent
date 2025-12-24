import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/generic_components/calendar.dart';
import 'package:univent/models/event.dart';
import 'package:univent/pages/home/bloc/home_bloc.dart';

class CalendarForm extends StatelessWidget {
  const CalendarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          margin: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Calendar(),
                const SizedBox(height: 16),
                _EventsSection(selectedDate: state.selectedDate, events: state.selectedDayEvents),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EventsSection extends StatelessWidget {
  final DateTime? selectedDate;
  final List<Event> events;

  const _EventsSection({required this.selectedDate, required this.events});

  @override
  Widget build(BuildContext context) {
    if (selectedDate == null) {
      return const Text(
        'Select a day to see events.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      );
    }

    if (events.isEmpty) {
      return const Text(
        'No events for this day.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      padding: EdgeInsets.zero,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final e = events[index];
        return _EventTile(event: e);
      },
    );
  }
}

class _EventTile extends StatelessWidget {
  final Event event;

  const _EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          '/eventInfo',
          extra: {'image': event.imageAsset, 'name': event.title, 'location': event.community, 'date': event.dateTimeText, 'cost': event.cost},
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (event.imageAsset != null && event.imageAsset!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  event.imageAsset!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(width: 56, height: 56),
                ),
              )
            else
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).dividerColor.withValues(alpha: 0.2)),
                child: const Icon(Icons.event),
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.title ?? '', style: Theme.of(context).textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  if ((event.community ?? '').isNotEmpty)
                    Text(event.community!, style: Theme.of(context).textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                  if ((event.dateTimeText ?? '').isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(event.dateTimeText!, style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  if ((event.cost ?? '').isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        event.cost!,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.red),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
