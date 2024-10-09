// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_segment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelSegment {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  set lat(double value) => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  set lng(double value) => throw _privateConstructorUsedError;
  TravelSegment? get next => throw _privateConstructorUsedError;
  set next(TravelSegment? value) => throw _privateConstructorUsedError;
  TravelSegment? get prev => throw _privateConstructorUsedError;
  set prev(TravelSegment? value) => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  set distance(double? value) => throw _privateConstructorUsedError;
  TravelSegmentType get type => throw _privateConstructorUsedError;
  set type(TravelSegmentType value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TravelSegmentCopyWith<TravelSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelSegmentCopyWith<$Res> {
  factory $TravelSegmentCopyWith(
          TravelSegment value, $Res Function(TravelSegment) then) =
      _$TravelSegmentCopyWithImpl<$Res, TravelSegment>;
  @useResult
  $Res call(
      {int id,
      double lat,
      double lng,
      TravelSegment? next,
      TravelSegment? prev,
      double? distance,
      TravelSegmentType type});

  $TravelSegmentCopyWith<$Res>? get next;
  $TravelSegmentCopyWith<$Res>? get prev;
}

/// @nodoc
class _$TravelSegmentCopyWithImpl<$Res, $Val extends TravelSegment>
    implements $TravelSegmentCopyWith<$Res> {
  _$TravelSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? distance = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelSegmentType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TravelSegmentCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $TravelSegmentCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TravelSegmentCopyWith<$Res>? get prev {
    if (_value.prev == null) {
      return null;
    }

    return $TravelSegmentCopyWith<$Res>(_value.prev!, (value) {
      return _then(_value.copyWith(prev: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelSegmentImplCopyWith<$Res>
    implements $TravelSegmentCopyWith<$Res> {
  factory _$$TravelSegmentImplCopyWith(
          _$TravelSegmentImpl value, $Res Function(_$TravelSegmentImpl) then) =
      __$$TravelSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double lat,
      double lng,
      TravelSegment? next,
      TravelSegment? prev,
      double? distance,
      TravelSegmentType type});

  @override
  $TravelSegmentCopyWith<$Res>? get next;
  @override
  $TravelSegmentCopyWith<$Res>? get prev;
}

/// @nodoc
class __$$TravelSegmentImplCopyWithImpl<$Res>
    extends _$TravelSegmentCopyWithImpl<$Res, _$TravelSegmentImpl>
    implements _$$TravelSegmentImplCopyWith<$Res> {
  __$$TravelSegmentImplCopyWithImpl(
      _$TravelSegmentImpl _value, $Res Function(_$TravelSegmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? distance = freezed,
    Object? type = null,
  }) {
    return _then(_$TravelSegmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelSegmentType,
    ));
  }
}

/// @nodoc

class _$TravelSegmentImpl implements _TravelSegment {
  _$TravelSegmentImpl(
      {required this.id,
      required this.lat,
      required this.lng,
      this.next,
      this.prev,
      this.distance,
      required this.type});

  @override
  int id;
  @override
  double lat;
  @override
  double lng;
  @override
  TravelSegment? next;
  @override
  TravelSegment? prev;
  @override
  double? distance;
  @override
  TravelSegmentType type;

  @override
  String toString() {
    return 'TravelSegment(id: $id, lat: $lat, lng: $lng, next: $next, prev: $prev, distance: $distance, type: $type)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelSegmentImplCopyWith<_$TravelSegmentImpl> get copyWith =>
      __$$TravelSegmentImplCopyWithImpl<_$TravelSegmentImpl>(this, _$identity);
}

abstract class _TravelSegment implements TravelSegment {
  factory _TravelSegment(
      {required int id,
      required double lat,
      required double lng,
      TravelSegment? next,
      TravelSegment? prev,
      double? distance,
      required TravelSegmentType type}) = _$TravelSegmentImpl;

  @override
  int get id;
  set id(int value);
  @override
  double get lat;
  set lat(double value);
  @override
  double get lng;
  set lng(double value);
  @override
  TravelSegment? get next;
  set next(TravelSegment? value);
  @override
  TravelSegment? get prev;
  set prev(TravelSegment? value);
  @override
  double? get distance;
  set distance(double? value);
  @override
  TravelSegmentType get type;
  set type(TravelSegmentType value);
  @override
  @JsonKey(ignore: true)
  _$$TravelSegmentImplCopyWith<_$TravelSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
