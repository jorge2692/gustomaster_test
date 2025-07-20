// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'height.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HeightAdapter extends TypeAdapter<Height> {
  @override
  final int typeId = 1;

  @override
  Height read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Height(
      imperial: fields[0] as String,
      metric: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Height obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.imperial)
      ..writeByte(1)
      ..write(obj.metric);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
