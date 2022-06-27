// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransmodAdapter extends TypeAdapter<Transmod> {
  @override
  final int typeId = 3;

  @override
  Transmod read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transmod(
      purpose: fields[0] as String,
      amount: fields[2] as double,
      type: fields[1] as type_of_categories,
      date: fields[3] as DateTime,
      category: fields[4] as Catmodel,
    );
  }

  @override
  void write(BinaryWriter writer, Transmod obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.purpose)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransmodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
