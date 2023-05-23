// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailAdapter extends TypeAdapter<CryptoCoinDetail> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetail(
      priceInUSD: fields[3] as double,
      imageUrl: fields[4] as String,
      low24Hours: fields[2] as double,
      hight24Hour: fields[1] as double,
      toSymbol: fields[0] as String,
      lastUpdate: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.toSymbol)
      ..writeByte(1)
      ..write(obj.hight24Hour)
      ..writeByte(2)
      ..write(obj.low24Hours)
      ..writeByte(3)
      ..write(obj.priceInUSD)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetail _$CryptoCoinDetailFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetail(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
      hight24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CryptoCoinDetail._dateTimeFromJson(json['LASTUPDATE'] as int),
    );

Map<String, dynamic> _$CryptoCoinDetailToJson(CryptoCoinDetail instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'HIGH24HOUR': instance.hight24Hour,
      'LOW24HOUR': instance.low24Hours,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'LASTUPDATE': CryptoCoinDetail._dateTimeToJson(instance.lastUpdate),
    };
