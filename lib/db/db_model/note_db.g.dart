// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_db.dart';

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
    return notesData(
      notetitle: fields[0] as String?,
      note: fields[1] as String?,
      imagelists: (fields[2] as List?)?.cast<dynamic>(),
      documentlist: (fields[3] as List?)?.cast<dynamic>(),
      category: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, notesData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.notetitle)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.imagelists)
      ..writeByte(3)
      ..write(obj.documentlist)
      ..writeByte(4)
      ..write(obj.category);
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
