import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitchcount/models/travel_segment_type.dart';
import 'package:hitchcount/providers/controllers/travel_segment_list/add_new_travel_segment_controller_provider.dart';

import '../models/travel_segment_model.dart';

class TravelSegmentTile extends StatelessWidget {
  const TravelSegmentTile(
      {Key? key, required this.travelSegment, required this.onRemove})
      : super(key: key);

  final TravelSegment travelSegment;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onRemove,
          ),
          Text(travelSegment.type.toString()),
        ],
      ),
    );
  }
}

class AddNewPlaceContainer extends ConsumerWidget {
  const AddNewPlaceContainer({Key? key, required this.onAccept})
      : super(key: key);

  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double startLen = 3.0;
    double startLon = 4.0;
    double endLen = 5.0;
    double endLon = 6.0;
    return Column(
      children: [
        Row(
          children: [
            Text('$startLon'),
            Text('$startLen'),
            Text('$endLon'),
            Text('$endLen'),
            TravelTypeDropdown(),
          ],
        ),
        AddNewPlaceButton(onPressed: onAccept),
      ],
    );
  }
}

class TravelTypeDropdown extends ConsumerWidget {
  const TravelTypeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownMenu<TravelSegmentType>(
      initialSelection: TravelSegmentType.hitchhike,
      label: const Text('Mode of travel'),
      onSelected: (TravelSegmentType? type) {
        if (type != null) {
          ref.read(addNewTravelSegmentController).type = type;
        }
      },
      dropdownMenuEntries: TravelSegmentType.values
          .map((TravelSegmentType type) => DropdownMenuEntry<TravelSegmentType>(
              value: type, label: type.name, leadingIcon: Icon(type.icon)))
          .toList(),
    );
  }
}

class AddNewPlaceButton extends StatelessWidget {
  const AddNewPlaceButton({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Dodaj nowy'),
    );
  }
}
