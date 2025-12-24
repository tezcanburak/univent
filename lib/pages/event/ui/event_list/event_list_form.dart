import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/models/event.dart';
import 'package:univent/pages/home/bloc/home_bloc.dart';

class EventListForm extends StatefulWidget {
  const EventListForm({super.key});

  @override
  State<EventListForm> createState() => _EventListFormState();
}

class _EventListFormState extends State<EventListForm> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  void _onSearchChanged(String query) {
    setState(() {
      _query = query.trim().toLowerCase();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.grey.shade300;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final filteredEvents = _query.isEmpty
            ? state.eventList
            : state.eventList.where((e) {
                final title = (e.title ?? '').toLowerCase();
                final community = (e.community ?? '').toLowerCase();
                final date = (e.dateTimeText ?? '').toLowerCase();
                return title.contains(_query) || community.contains(_query) || date.contains(_query);
              }).toList();

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            SizedBox(height: MediaQuery.of(context).padding.top + 12),
            Container(
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: ColorConstants.darkGrey,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: filteredEvents.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (context, index) {
                      final e = filteredEvents[index];
                      return _EventTile(event: e);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}

class _EventTile extends StatelessWidget {
  final Event event;

  const _EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: () {
        context.push(
          '/eventInfo',
          extra: {'image': event.imageAsset, 'name': event.title, 'location': event.community, 'date': event.dateTimeText, 'cost': event.cost},
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: ColorConstants.lightGrey, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    event.title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    event.community ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    event.dateTimeText ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(event.imageAsset ?? '', width: width * 0.28, height: width * 0.28, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
