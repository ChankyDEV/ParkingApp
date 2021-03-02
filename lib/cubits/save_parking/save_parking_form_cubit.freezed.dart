// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'save_parking_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SaveParkingFormStateTearOff {
  const _$SaveParkingFormStateTearOff();

// ignore: unused_element
  _Initial initial(
      {String name,
      String description,
      double rating,
      String nameLabel,
      String descriptionLabel}) {
    return _Initial(
      name: name,
      description: description,
      rating: rating,
      nameLabel: nameLabel,
      descriptionLabel: descriptionLabel,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SaveParkingFormState = _$SaveParkingFormStateTearOff();

/// @nodoc
mixin _$SaveParkingFormState {
  String get name;
  String get description;
  double get rating;
  String get nameLabel;
  String get descriptionLabel;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(String name, String description, double rating,
            String nameLabel, String descriptionLabel),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(String name, String description, double rating,
        String nameLabel, String descriptionLabel),
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
  $SaveParkingFormStateCopyWith<SaveParkingFormState> get copyWith;
}

/// @nodoc
abstract class $SaveParkingFormStateCopyWith<$Res> {
  factory $SaveParkingFormStateCopyWith(SaveParkingFormState value,
          $Res Function(SaveParkingFormState) then) =
      _$SaveParkingFormStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      double rating,
      String nameLabel,
      String descriptionLabel});
}

/// @nodoc
class _$SaveParkingFormStateCopyWithImpl<$Res>
    implements $SaveParkingFormStateCopyWith<$Res> {
  _$SaveParkingFormStateCopyWithImpl(this._value, this._then);

  final SaveParkingFormState _value;
  // ignore: unused_field
  final $Res Function(SaveParkingFormState) _then;

  @override
  $Res call({
    Object name = freezed,
    Object description = freezed,
    Object rating = freezed,
    Object nameLabel = freezed,
    Object descriptionLabel = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      rating: rating == freezed ? _value.rating : rating as double,
      nameLabel: nameLabel == freezed ? _value.nameLabel : nameLabel as String,
      descriptionLabel: descriptionLabel == freezed
          ? _value.descriptionLabel
          : descriptionLabel as String,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $SaveParkingFormStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      double rating,
      String nameLabel,
      String descriptionLabel});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$SaveParkingFormStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object name = freezed,
    Object description = freezed,
    Object rating = freezed,
    Object nameLabel = freezed,
    Object descriptionLabel = freezed,
  }) {
    return _then(_Initial(
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      rating: rating == freezed ? _value.rating : rating as double,
      nameLabel: nameLabel == freezed ? _value.nameLabel : nameLabel as String,
      descriptionLabel: descriptionLabel == freezed
          ? _value.descriptionLabel
          : descriptionLabel as String,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {this.name,
      this.description,
      this.rating,
      this.nameLabel,
      this.descriptionLabel});

  @override
  final String name;
  @override
  final String description;
  @override
  final double rating;
  @override
  final String nameLabel;
  @override
  final String descriptionLabel;

  @override
  String toString() {
    return 'SaveParkingFormState.initial(name: $name, description: $description, rating: $rating, nameLabel: $nameLabel, descriptionLabel: $descriptionLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.nameLabel, nameLabel) ||
                const DeepCollectionEquality()
                    .equals(other.nameLabel, nameLabel)) &&
            (identical(other.descriptionLabel, descriptionLabel) ||
                const DeepCollectionEquality()
                    .equals(other.descriptionLabel, descriptionLabel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(nameLabel) ^
      const DeepCollectionEquality().hash(descriptionLabel);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(String name, String description, double rating,
            String nameLabel, String descriptionLabel),
  }) {
    assert(initial != null);
    return initial(name, description, rating, nameLabel, descriptionLabel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(String name, String description, double rating,
        String nameLabel, String descriptionLabel),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(name, description, rating, nameLabel, descriptionLabel);
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

abstract class _Initial implements SaveParkingFormState {
  const factory _Initial(
      {String name,
      String description,
      double rating,
      String nameLabel,
      String descriptionLabel}) = _$_Initial;

  @override
  String get name;
  @override
  String get description;
  @override
  double get rating;
  @override
  String get nameLabel;
  @override
  String get descriptionLabel;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
