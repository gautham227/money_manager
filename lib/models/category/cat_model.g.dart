// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatmodelAdapter extends TypeAdapter<Catmodel> {
  @override
  final int typeId = 1;

  @override
  Catmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Catmodel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      type: fields[3] as type_of_categories?,
      del: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Catmodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.del)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class typeofcategoriesAdapter extends TypeAdapter<type_of_categories> {
  @override
  final int typeId = 2;

  @override
  type_of_categories read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return type_of_categories.income;
      case 1:
        return type_of_categories.expense;
      default:
        return type_of_categories.income;
    }
  }

  @override
  void write(BinaryWriter writer, type_of_categories obj) {
    switch (obj) {
      case type_of_categories.income:
        writer.writeByte(0);
        break;
      case type_of_categories.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is typeofcategoriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
