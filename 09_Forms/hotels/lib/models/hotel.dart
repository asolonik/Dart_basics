import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable()
class Hotel {
  @JsonKey(defaultValue: '')
  final String? uuid;
  @JsonKey(defaultValue: '')
  final String? name;
  @JsonKey(defaultValue: '')
  final String? poster;

  Hotel({this.uuid, this.name, this.poster});

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}
