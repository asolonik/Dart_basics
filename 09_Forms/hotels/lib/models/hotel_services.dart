import 'package:json_annotation/json_annotation.dart';

part 'hotel_services.g.dart';

@JsonSerializable()
class HotelServices {
  @JsonKey(defaultValue: [])
  List<String> free = [];
  @JsonKey(defaultValue: [])
  List<String> paid = [];

  HotelServices({required this.free, required this.paid});

  HotelServices.empty() : this(free: [], paid: []);

  factory HotelServices.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}
