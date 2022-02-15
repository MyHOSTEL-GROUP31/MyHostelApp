class InspirationTitle {
  final String title, image;
  final int minutes;
  final InspirationType type;
  InspirationTitle(
      {required this.title,
      this.minutes = 0,
      this.type = InspirationType.TRAVEL,
      required this.image})
      : assert(title != null),
        assert(image != null);
  String getType(InspirationType type) {
    switch (type) {
      case InspirationType.TRAVEL:
        return 'Outside University';
        break;
      case InspirationType.BEACH:
        return 'Inside University';
        break;
      case InspirationType.BEDROOM:
        return 'private apartments';
        break;
      case InspirationType.DINNER:
        return 'Outside University';
        break;
      default:
        return 'Unknow';
        break;
    }
  }
}

enum InspirationType { TRAVEL, BEACH, BEDROOM, DINNER }
