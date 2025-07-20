// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorite_dog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserFavoriteDogAdapter extends TypeAdapter<UserFavoriteDog> {
  @override
  final int typeId = 2;

  @override
  UserFavoriteDog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserFavoriteDog(
      name: fields[0] as String,
      dogBreed: fields[1] as DogBreed,
    );
  }

  @override
  void write(BinaryWriter writer, UserFavoriteDog obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dogBreed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserFavoriteDogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
