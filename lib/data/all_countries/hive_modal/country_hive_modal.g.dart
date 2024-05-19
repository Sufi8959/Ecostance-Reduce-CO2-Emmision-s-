// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_hive_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryHiveModalAdapter extends TypeAdapter<CountryHiveModal> {
  @override
  final int typeId = 2;

  @override
  CountryHiveModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryHiveModal(
      id: fields[0] as String,
      entity: fields[1] as String,
      countryCode: fields[2] as String,
      currencyName: fields[3] as String,
      currencyCode: fields[4] as String,
      numericCode: fields[5] as String,
      minorUnit: fields[6] as String,
      carbonCountryCode: fields[7] as String,
      carbonCountryPerCapita: fields[8] as String,
      phonePrefix: fields[9] as String,
      status: fields[10] as String,
      show: fields[11] as String,
      createdAt: fields[12] as DateTime,
      updatedAt: fields[13] as DateTime,
      v: fields[14] as int,
      fromServer: fields[15] as bool,
      isCurrencySupported: fields[16] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CountryHiveModal obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.entity)
      ..writeByte(2)
      ..write(obj.countryCode)
      ..writeByte(3)
      ..write(obj.currencyName)
      ..writeByte(4)
      ..write(obj.currencyCode)
      ..writeByte(5)
      ..write(obj.numericCode)
      ..writeByte(6)
      ..write(obj.minorUnit)
      ..writeByte(7)
      ..write(obj.carbonCountryCode)
      ..writeByte(8)
      ..write(obj.carbonCountryPerCapita)
      ..writeByte(9)
      ..write(obj.phonePrefix)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.show)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.v)
      ..writeByte(15)
      ..write(obj.fromServer)
      ..writeByte(16)
      ..write(obj.isCurrencySupported);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryHiveModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
