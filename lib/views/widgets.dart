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
            'Lat: ${travelSegment.lat.toStringAsPrecision(4)} Lng: ${travelSegment.lng.toStringAsPrecision(4)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          travelSegment.distance != null
              ? Text(
                  'Distance: ${travelSegment.distance?.toStringAsPrecision(4)} km')
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class AddNewPlaceContainer extends ConsumerWidget {
  const AddNewPlaceContainer({Key? key, this.isFirst = false})
      : super(key: key);

  final bool isFirst;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController lngController = TextEditingController();
    final TextEditingController latController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: width * 0.4,
        child: Column(
          children: [
            Row(
              children: [
                // Wrap each TextField in a Flexible to allow the Row to handle dynamic widths
                Flexible(
                  child: TextField(
                    controller: lngController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Latitude'),
                    onChanged: (value) {
                      double? lat = double.tryParse(value);
                      if (lat != null) {
                        ref.read(addNewTravelSegmentController).lat = lat;
                      }
                    },
                  ),
                ),
                SizedBox(width: 10), // Add spacing between fields
                Flexible(
                  child: TextField(
                    controller: latController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Longitude'),
                    onChanged: (value) {
                      double? lng = double.tryParse(value);
                      if (lng != null) {
                        ref.read(addNewTravelSegmentController).lng = lng;
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            isFirst ? SizedBox.shrink() : TravelTypeDropdown(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class AddStartingPointContainer extends ConsumerWidget {
  const AddStartingPointContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class TravelTypeDropdown extends ConsumerWidget {
  const TravelTypeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownMenu<TravelSegmentType>(
      initialSelection: ref.read(addNewTravelSegmentController).type,
      label: const Text('Mode of travel'),
      onSelected: (TravelSegmentType? type) {
        if (type != null) {
          ref.read(addNewTravelSegmentController).type = type;
        }
      },
      dropdownMenuEntries: TravelSegmentType.values
          .where((TravelSegmentType type) => type != TravelSegmentType.start)
          .map(
            (TravelSegmentType type) => DropdownMenuEntry<TravelSegmentType>(
              value: type,
              label: type.name,
              leadingIcon: Icon(type.icon),
            ),
          )
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
        double lat = ref.read(addNewTravelSegmentController).lat;

        double lng = ref.read(addNewTravelSegmentController).lng;

        TravelSegmentType travelSegmentType =
            ref.read(addNewTravelSegmentController).type;
        ref
            .read(travelSegmentNotifier.notifier)
            .add(lat, lng, travelSegmentType);
      },
      child: Text('Dodaj nowy'),
    );
  }
}
