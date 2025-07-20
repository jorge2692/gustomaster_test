// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_dog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalDogAdapter extends TypeAdapter<LocalDog> {
  @override
  final int typeId = 0;

  @override
  LocalDog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDog(
      id: fields[0] as int,
      name: fields[1] as String,
      bredFor: fields[2] as String,
      breedGroup: fields[3] as String,
      lifeSpan: fields[4] as String,
      temperament: fields[5] as String,
      origin: fields[6] as String,
      imageUrl: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalDog obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.bredFor)
      ..writeByte(3)
      ..write(obj.breedGroup)
      ..writeByte(4)
      ..write(obj.lifeSpan)
      ..writeByte(5)
      ..write(obj.temperament)
      ..writeByte(6)
      ..write(obj.origin)
      ..writeByte(7)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
