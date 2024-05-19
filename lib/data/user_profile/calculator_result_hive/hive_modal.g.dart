// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveCalculationsHiveAdapter extends TypeAdapter<SaveCalculationsHive> {
  @override
  final int typeId = 4;

  @override
  SaveCalculationsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveCalculationsHive(
      houseHoldMembers: fields[0] as int,
      publicTransportationMembers: fields[1] as int,
      income: fields[2] as String,
      houseSize: fields[3] as String,
      airTravel: fields[4] as String,
      meatConsumption: fields[5] as String,
      totalCarbonEmissions: fields[6] as double,
      countryCode: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SaveCalculationsHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.houseHoldMembers)
      ..writeByte(1)
      ..write(obj.publicTransportationMembers)
      ..writeByte(2)
      ..write(obj.income)
      ..writeByte(3)
      ..write(obj.houseSize)
      ..writeByte(4)
      ..write(obj.airTravel)
      ..writeByte(5)
      ..write(obj.meatConsumption)
      ..writeByte(6)
      ..write(obj.totalCarbonEmissions)
      ..writeByte(7)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveCalculationsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
