import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitchcount/providers/controllers/travel_segment_list/travel_segment_list_controller_provider.dart';

import '../models/travel_segment_model.dart';
import 'widgets.dart';

class AddPlacesView extends ConsumerWidget {
  const AddPlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // ref.watch(travelSegmentListChangeNotifierProvider);
    List<TravelSegment> travelSegments = ref.watch(travelSegmentNotifier);
    List<TravelSegment> orderedTravelSegments =
        ref.read(travelSegmentNotifier.notifier).getOrderedSegments();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Make the Column take up only the space it needs
            children: [
              // Constrain the ListView's height to a max height
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: height * 0.6, // Set a max height for the list
                  maxWidth: width * 0.4,
                ),
                child: ReorderableListView(
                  shrinkWrap:
                      true, // Let the ListView take only the required space
                  children: [
                    for (TravelSegment travelSegment in orderedTravelSegments)
                      TravelSegmentTile(
                        travelSegment: travelSegment,
                        onRemove: () {
                          ref
                              .read(travelSegmentNotifier.notifier)
                              .remove(travelSegment);
                        },
                        key: ValueKey(travelSegment),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex--;
                    }
                    ref
                        .read(travelSegmentNotifier.notifier)
                        .movePlaces(oldIndex, newIndex);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Button will always be placed directly under the list
              AddNewPlaceContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
