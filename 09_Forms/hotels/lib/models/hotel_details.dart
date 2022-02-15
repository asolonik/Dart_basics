import 'package:hotels/models/hotel_address.dart';
import 'package:hotels/models/hotel_services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_details.g.dart';

@JsonSerializable()
class HotelDetails {
  @JsonKey(defaultValue: '')
  String uuid;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String poster;
  @JsonKey(defaultValue: 0.0)
  double price;
  @JsonKey(defaultValue: 0.0)
  double rating;

  String message = '';

  HotelAddress address = HotelAddress.empty();
  HotelServices services = HotelServices.empty();
  List<String> photos = [];

  HotelDetails(
      {required this.uuid,
      required this.name,
      required this.poster,
      required this.price,
      required this.rating,
      required this.address,
      required this.services,
      required this.photos});
  HotelDetails.empty()
      : this(
            uuid: '',
            name: '',
            poster: '',
            price: 0,
            rating: 0,
            address: HotelAddress.empty(),
            services: HotelServices.empty(),
            photos: []);

  factory HotelDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);
}
