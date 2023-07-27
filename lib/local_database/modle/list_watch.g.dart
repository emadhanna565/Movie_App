// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_watch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListWatchAdapter extends TypeAdapter<ListWatch> {
  @override
  final int typeId = 1;

  @override
  ListWatch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListWatch(
      title: fields[0] as String,
      releaseDate: fields[1] as String,
      posterPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListWatch obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.releaseDate)
      ..writeByte(2)
      ..write(obj.posterPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListWatchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
