class HotelInfo {
  final String name, image;
  final double price;
  final String distance;

  final HotelType type;

  HotelInfo({
    required this.name,
    required this.image,
    required this.distance,
    this.price = 20.0,
    this.type = HotelType.HOTEL,
  })  : assert(name != null),
        assert(image != null);
}

enum HotelType { HOTEL, RESORT }
