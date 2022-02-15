import 'package:myhostel/others/level3/hotel_info.dart';
import 'package:myhostel/others/level3/inspiration_title.dart';
import 'package:myhostel/others/level3/service_tag.dart';
import 'package:myhostel/others/level2/constants.dart';

class ExampleData {
  List<HotelInfo> getHotelData() => [
        HotelInfo(
          name: 'APEX HOSTEL',
          image: 'assets/images/apex.jpg',
          type: HotelType.HOTEL,
          distance: 'kikoni',
          price: 500000,
          //rating: 4.5,
          //reviewers: 5378
        ),
        HotelInfo(
          name: 'KANN HOSTEL',
          image: 'assets/images/kann.jpg',
          type: HotelType.HOTEL,
          distance: 'kikoni',
          price: 600000,
        ),
        HotelInfo(
          name: 'KARE HOSTEL',
          image: 'assets/images/kare.jpg',
          type: HotelType.RESORT,
          distance: 'kikoni',
          price: 400000,
        ),
        HotelInfo(
          name: 'GARDEN GROOVE ',
          image: 'assets/images/gaden.jpg',
          type: HotelType.RESORT,
          distance: 'kikoni',
          price: 550000,
        ),
      ];

  List<InspirationTitle> getInspiration() => [
        InspirationTitle(
            title: 'UNIVERSITY HALLS',
            image: 'assets/images/nkuluma.jpeg',
            type: InspirationType.BEACH),
        InspirationTitle(
            title: 'HOSTELS',
            image: 'assets/images/nalikah.jpg',
            type: InspirationType.DINNER),
        InspirationTitle(
            title: 'RENTALS',
            image: 'assets/images/prince.jpg',
            type: InspirationType.BEDROOM),
      ];

  List<ServiceTag> getServiceTags() => [
        ServiceTag(name: 'Hotel', color: kTagHotelColor),
        ServiceTag(name: 'Rent', color: kTagRentColor),
        ServiceTag(name: 'Flight', color: kTagFlightColor),
        ServiceTag(name: 'Event', color: kTagEventColor),
      ];

  List<String> getNavigationIcon() => [
        'assets/icons/home_screen/bp_home_icon.svg',
        'assets/icons/home_screen/bp_favorite_icon.svg',
        'assets/icons/home_screen/bp_message_icon.svg',
        'assets/icons/home_screen/bp_info_icon.svg'
      ];

  List<ServiceTag> getAmenitiesTags() => [
        ServiceTag(
          name: 'Gym',
          color: kBackgroundColor,
        ),
        ServiceTag(
          name: 'Breakfast',
          color: kBackgroundColor,
        ),
        ServiceTag(
          name: 'Parking',
          color: kBackgroundColor,
        ),
        ServiceTag(
          name: 'Bar',
          color: kBackgroundColor,
        ),
        ServiceTag(
          name: 'More',
          color: kBackgroundColor,
        ),
      ];
}
