import 'package:freezed_annotation/freezed_annotation.dart';

import 'travel_segment_type.dart';

part 'travel_segment_model.freezed.dart';

@unfreezed
class TravelSegment with _$TravelSegment {
  factory TravelSegment(
      {required int id,
      required double start_lat,
      required double start_lon,
      required double end_lat,
      required double end_lon,
      TravelSegment? next,
      TravelSegment? prev,
      double? distance,
      required TravelSegmentType type}) = _TravelSegment;
  // factory TravelSegment.fromJson(Map<String, dynamic> json) =>
  //     _$TravelSegmentFromJson(json);
}
