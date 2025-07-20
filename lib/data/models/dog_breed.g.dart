// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DogBreedAdapter extends TypeAdapter<DogBreed> {
  @override
  final int typeId = 0;

  @override
  DogBreed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DogBreed(
      id: fields[0] as int,
      name: fields[1] as String,
      bredFor: fields[2] as String,
      breedGroup: fields[3] as String,
      lifeSpan: fields[4] as String,
      temperament: fields[5] as String,
      origin: fields[6] as String,
      imageUrl: fields[7] as String,
      height: fields[8] as Height,
      weight: fields[9] as Weight,
    );
  }

  @override
  void write(BinaryWriter writer, DogBreed obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.imageUrl)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogBreedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
