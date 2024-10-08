import 'package:flutter/material.dart';

import '../../../models/travel_segment_model.dart';

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

class AddNewPlaceContainer extends StatelessWidget {
  const AddNewPlaceContainer({Key? key, required this.onAccept})
      : super(key: key);

  final VoidCallback onAccept;
  @override
  Widget build(BuildContext context) {
    double startLen = 3.0;
    double startLon = 4.0;
    double endLen = 5.0;
    double oldLon = 6.0;
    return Row(
      children: [
        Text('Start len'),
        Text('Start lon'),
        Text('End len'),
        Text('Old lon'),
        AddNewPlaceButton(onPressed: onAccept),
      ],
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
