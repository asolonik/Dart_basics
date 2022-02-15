// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDetails _$HotelDetailsFromJson(Map<String, dynamic> json) => HotelDetails(
      uuid: json['uuid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      poster: json['poster'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      address: HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
      services:
          HotelServices.fromJson(json['services'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelDetailsToJson(HotelDetails instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'price': instance.price,
      'rating': instance.rating,
      'address': instance.address,
      'services': instance.services,
      'photos': instance.photos,
    };
