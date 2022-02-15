// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) => HotelAddress(
      country: json['country'] as String? ?? '',
      street: json['street'] as String? ?? '',
      city: json['city'] as String? ?? '',
      zip_code: json['zip_code'] as int? ?? 0,
      coords: GeoCoord.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zip_code,
      'coords': instance.coords,
    };
