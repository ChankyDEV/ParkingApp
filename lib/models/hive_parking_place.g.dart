// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_parking_place.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTypeAdapter extends TypeAdapter<HiveParkingPlace> {
  @override
  final int typeId = 0;

  @override
  HiveParkingPlace read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveParkingPlace(
      fields[0] as double,
      fields[1] as double,
      fields[2] as String,
      fields[3] as String,
      fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HiveParkingPlace obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.descripion)
      ..writeByte(4)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
