// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_coord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoCoord _$GeoCoordFromJson(Map<String, dynamic> json) => GeoCoord(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lan: (json['lan'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$GeoCoordToJson(GeoCoord instance) => <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };
