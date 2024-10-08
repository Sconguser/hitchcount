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
  double get start_lat => throw _privateConstructorUsedError;
  set start_lat(double value) => throw _privateConstructorUsedError;
  double get start_lon => throw _privateConstructorUsedError;
  set start_lon(double value) => throw _privateConstructorUsedError;
  double get end_lat => throw _privateConstructorUsedError;
  set end_lat(double value) => throw _privateConstructorUsedError;
  double get end_lon => throw _privateConstructorUsedError;
  set end_lon(double value) => throw _privateConstructorUsedError;
  TravelSegment? get next => throw _privateConstructorUsedError;
  set next(TravelSegment? value) => throw _privateConstructorUsedError;
  TravelSegment? get prev => throw _privateConstructorUsedError;
  set prev(TravelSegment? value) => throw _privateConstructorUsedError;
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
      double start_lat,
      double start_lon,
      double end_lat,
      double end_lon,
      TravelSegment? next,
      TravelSegment? prev,
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
    Object? start_lat = null,
    Object? start_lon = null,
    Object? end_lat = null,
    Object? end_lon = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      start_lat: null == start_lat
          ? _value.start_lat
          : start_lat // ignore: cast_nullable_to_non_nullable
              as double,
      start_lon: null == start_lon
          ? _value.start_lon
          : start_lon // ignore: cast_nullable_to_non_nullable
              as double,
      end_lat: null == end_lat
          ? _value.end_lat
          : end_lat // ignore: cast_nullable_to_non_nullable
              as double,
      end_lon: null == end_lon
          ? _value.end_lon
          : end_lon // ignore: cast_nullable_to_non_nullable
              as double,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
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
      double start_lat,
      double start_lon,
      double end_lat,
      double end_lon,
      TravelSegment? next,
      TravelSegment? prev,
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
    Object? start_lat = null,
    Object? start_lon = null,
    Object? end_lat = null,
    Object? end_lon = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? type = null,
  }) {
    return _then(_$TravelSegmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      start_lat: null == start_lat
          ? _value.start_lat
          : start_lat // ignore: cast_nullable_to_non_nullable
              as double,
      start_lon: null == start_lon
          ? _value.start_lon
          : start_lon // ignore: cast_nullable_to_non_nullable
              as double,
      end_lat: null == end_lat
          ? _value.end_lat
          : end_lat // ignore: cast_nullable_to_non_nullable
              as double,
      end_lon: null == end_lon
          ? _value.end_lon
          : end_lon // ignore: cast_nullable_to_non_nullable
              as double,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as TravelSegment?,
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
      required this.start_lat,
      required this.start_lon,
      required this.end_lat,
      required this.end_lon,
      this.next,
      this.prev,
      required this.type});

  @override
  int id;
  @override
  double start_lat;
  @override
  double start_lon;
  @override
  double end_lat;
  @override
  double end_lon;
  @override
  TravelSegment? next;
  @override
  TravelSegment? prev;
  @override
  TravelSegmentType type;

  @override
  String toString() {
    return 'TravelSegment(id: $id, start_lat: $start_lat, start_lon: $start_lon, end_lat: $end_lat, end_lon: $end_lon, next: $next, prev: $prev, type: $type)';
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
      required double start_lat,
      required double start_lon,
      required double end_lat,
      required double end_lon,
      TravelSegment? next,
      TravelSegment? prev,
      required TravelSegmentType type}) = _$TravelSegmentImpl;

  @override
  int get id;
  set id(int value);
  @override
  double get start_lat;
  set start_lat(double value);
  @override
  double get start_lon;
  set start_lon(double value);
  @override
  double get end_lat;
  set end_lat(double value);
  @override
  double get end_lon;
  set end_lon(double value);
  @override
  TravelSegment? get next;
  set next(TravelSegment? value);
  @override
  TravelSegment? get prev;
  set prev(TravelSegment? value);
  @override
  TravelSegmentType get type;
  set type(TravelSegmentType value);
  @override
  @JsonKey(ignore: true)
  _$$TravelSegmentImplCopyWith<_$TravelSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
