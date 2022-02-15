import 'package:hotels/models/geo_coord.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_address.g.dart';

@JsonSerializable()
class HotelAddress {
  @JsonKey(defaultValue: '')
  String country;
  @JsonKey(defaultValue: '')
  String street;
  @JsonKey(defaultValue: '')
  String city;
  @JsonKey(defaultValue: 0)
  int zip_code;
  GeoCoord coords;

  HotelAddress(
      {required this.country,
      required this.street,
      required this.city,
      required this.zip_code,
      required this.coords});
  HotelAddress.empty()
      : this(
            country: '',
            street: '',
            city: '',
            zip_code: 0,
            coords: GeoCoord.empty());

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}
