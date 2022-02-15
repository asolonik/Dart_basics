import 'package:json_annotation/json_annotation.dart';

part 'geo_coord.g.dart';

@JsonSerializable()
class GeoCoord {
  @JsonKey(defaultValue: 0.0)
  double lat;
  @JsonKey(defaultValue: 0.0)
  double lan;

  GeoCoord({required this.lat, required this.lan});
  GeoCoord.empty() : this(lat: 0, lan: 0);

  factory GeoCoord.fromJson(Map<String, dynamic> json) =>
      _$GeoCoordFromJson(json);
  Map<String, dynamic> toJson() => _$GeoCoordToJson(this);
}
