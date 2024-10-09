import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitchcount/models/travel_segment_type.dart';
import 'package:hitchcount/providers/controllers/travel_segment_list/add_new_travel_segment_controller_provider.dart';
import 'package:hitchcount/providers/controllers/travel_segment_list/travel_segment_list_controller_provider.dart';

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
            icon: const Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
            ),
            onPressed: onRemove,
          ),
          Icon(travelSegment.type.icon),
          SizedBox(
            width: 10,
          ),
          Text(travelSegment.type.name),
          SizedBox(width: 10),
          Text(
            'Lon: ${travelSegment.start_lon} Lat: ${travelSegment.start_lat}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          travelSegment.distance != null
              ? Text('Distance: ${travelSegment.distance}')
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class AddNewPlaceContainer extends ConsumerWidget {
  const AddNewPlaceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController startLonController = TextEditingController();
    final TextEditingController startLatController = TextEditingController();
    final TextEditingController endLonController = TextEditingController();
    final TextEditingController endLatController = TextEditingController();

    return Column(
      children: [
        Row(
          children: [
            // Wrap each TextField in a Flexible to allow the Row to handle dynamic widths
            Flexible(
              child: TextField(
                controller: startLonController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Start Longitude'),
                onChanged: (value) {
                  double? lon = double.tryParse(value);
                  if (lon != null) {
                    ref.read(addNewTravelSegmentController).start_lon = lon;
                  }
                },
              ),
            ),
            SizedBox(width: 10), // Add spacing between fields
            Flexible(
              child: TextField(
                controller: startLatController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Start Latitude'),
                onChanged: (value) {
                  double? lat = double.tryParse(value);
                  if (lat != null) {
                    ref.read(addNewTravelSegmentController).start_lat = lat;
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Add some space between rows
        Row(
          children: [
            Flexible(
              child: TextField(
                controller: endLonController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'End Longitude'),
                onChanged: (value) {
                  double? lon = double.tryParse(value);
                  if (lon != null) {
                    ref.read(addNewTravelSegmentController).end_lon = lon;
                  }
                },
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: TextField(
                controller: endLatController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'End Latitude'),
                onChanged: (value) {
                  double? lat = double.tryParse(value);
                  if (lat != null) {
                    ref.read(addNewTravelSegmentController).end_lat = lat;
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TravelTypeDropdown(),
        SizedBox(height: 10),
        AddNewPlaceButton(),
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

class AddNewPlaceButton extends ConsumerWidget {
  const AddNewPlaceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        double startLat = ref.read(addNewTravelSegmentController).start_lat;

        double startLon = ref.read(addNewTravelSegmentController).start_lon;

        double endLat = ref.read(addNewTravelSegmentController).end_lat;
        double endLon = ref.read(addNewTravelSegmentController).end_lon;
        TravelSegmentType travelSegmentType =
            ref.read(addNewTravelSegmentController).type;
        ref
            .read(travelSegmentNotifier.notifier)
            .add(startLat, startLon, endLat, endLon, travelSegmentType);
      },
      child: Text('Dodaj nowy'),
    );
  }
}
