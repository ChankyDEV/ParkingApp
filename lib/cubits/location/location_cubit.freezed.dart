// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LocationStateTearOff {
  const _$LocationStateTearOff();

// ignore: unused_element
  _Initial initial(
      {Position position,
      Set<Marker> markers,
      List<ParkingPlace> parkings,
      ParkingPlace chosenParking}) {
    return _Initial(
      position: position,
      markers: markers,
      parkings: parkings,
      chosenParking: chosenParking,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LocationState = _$LocationStateTearOff();

/// @nodoc
mixin _$LocationState {
  Position get position;
  Set<Marker> get markers;
  List<ParkingPlace> get parkings;
  ParkingPlace get chosenParking;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(Position position, Set<Marker> markers,
            List<ParkingPlace> parkings, ParkingPlace chosenParking),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(Position position, Set<Marker> markers,
        List<ParkingPlace> parkings, ParkingPlace chosenParking),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $LocationStateCopyWith<LocationState> get copyWith;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
  $Res call(
      {Position position,
      Set<Marker> markers,
      List<ParkingPlace> parkings,
      ParkingPlace chosenParking});
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;

  @override
  $Res call({
    Object position = freezed,
    Object markers = freezed,
    Object parkings = freezed,
    Object chosenParking = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed ? _value.position : position as Position,
      markers: markers == freezed ? _value.markers : markers as Set<Marker>,
      parkings: parkings == freezed
          ? _value.parkings
          : parkings as List<ParkingPlace>,
      chosenParking: chosenParking == freezed
          ? _value.chosenParking
          : chosenParking as ParkingPlace,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {Position position,
      Set<Marker> markers,
      List<ParkingPlace> parkings,
      ParkingPlace chosenParking});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object position = freezed,
    Object markers = freezed,
    Object parkings = freezed,
    Object chosenParking = freezed,
  }) {
    return _then(_Initial(
      position: position == freezed ? _value.position : position as Position,
      markers: markers == freezed ? _value.markers : markers as Set<Marker>,
      parkings: parkings == freezed
          ? _value.parkings
          : parkings as List<ParkingPlace>,
      chosenParking: chosenParking == freezed
          ? _value.chosenParking
          : chosenParking as ParkingPlace,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {this.position, this.markers, this.parkings, this.chosenParking});

  @override
  final Position position;
  @override
  final Set<Marker> markers;
  @override
  final List<ParkingPlace> parkings;
  @override
  final ParkingPlace chosenParking;

  @override
  String toString() {
    return 'LocationState.initial(position: $position, markers: $markers, parkings: $parkings, chosenParking: $chosenParking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.markers, markers) ||
                const DeepCollectionEquality()
                    .equals(other.markers, markers)) &&
            (identical(other.parkings, parkings) ||
                const DeepCollectionEquality()
                    .equals(other.parkings, parkings)) &&
            (identical(other.chosenParking, chosenParking) ||
                const DeepCollectionEquality()
                    .equals(other.chosenParking, chosenParking)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(markers) ^
      const DeepCollectionEquality().hash(parkings) ^
      const DeepCollectionEquality().hash(chosenParking);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(Position position, Set<Marker> markers,
            List<ParkingPlace> parkings, ParkingPlace chosenParking),
  }) {
    assert(initial != null);
    return initial(position, markers, parkings, chosenParking);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(Position position, Set<Marker> markers,
        List<ParkingPlace> parkings, ParkingPlace chosenParking),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(position, markers, parkings, chosenParking);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  }) {
    assert(initial != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocationState {
  const factory _Initial(
      {Position position,
      Set<Marker> markers,
      List<ParkingPlace> parkings,
      ParkingPlace chosenParking}) = _$_Initial;

  @override
  Position get position;
  @override
  Set<Marker> get markers;
  @override
  List<ParkingPlace> get parkings;
  @override
  ParkingPlace get chosenParking;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
