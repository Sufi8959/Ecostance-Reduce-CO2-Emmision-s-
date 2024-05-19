// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_hive_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCartModalAdapter extends TypeAdapter<HiveCartModal> {
  @override
  final int typeId = 1;

  @override
  HiveCartModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCartModal(
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCartModal obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCartModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
