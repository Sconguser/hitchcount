import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/travel_segment_model.dart';
import '../../../models/travel_segment_type.dart';

final addNewTravelSegmentController =
    StateProvider<TravelSegment>((ref) => TravelSegment(
          id: 0,
          start_lon: 4.0,
          start_lat: 3.0,
          end_lat: 6.0,
          end_lon: 5.0,
          type: TravelSegmentType.hitchhike,
        ));
