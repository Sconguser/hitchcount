import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/travel_segment_model.dart';
import '../../../models/travel_segment_type.dart';

final addNewTravelSegmentController =
    StateProvider<TravelSegment>((ref) => TravelSegment(
          id: 0,
          lng: 0.0,
          lat: 0.0,
          type: TravelSegmentType.start,
        ));
