// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dbmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notesDataAdapter extends TypeAdapter<notesData> {
  @override
  final int typeId = 2;

  @override
  notesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notesData()
      ..note = fields[0] as String
      ..imagelists = (fields[1] as List).cast<dynamic>()
      ..documentlist = (fields[2] as List).cast<dynamic>();
  }

  @override
  void write(BinaryWriter writer, notesData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.note)
      ..writeByte(1)
      ..write(obj.imagelists)
      ..writeByte(2)
      ..write(obj.documentlist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
