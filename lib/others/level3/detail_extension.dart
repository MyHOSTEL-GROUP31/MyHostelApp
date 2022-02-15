import 'package:flutter/material.dart';
import 'package:myhostel/others/level2/example_data.dart';
import 'package:myhostel/others/level3/hotel_info.dart';
import 'package:myhostel/others/level3/service_tag.dart';
import 'package:myhostel/others/level2/constants.dart';
import 'package:myhostel/others/level4/button_service_tag.dart';
import 'package:myhostel/models/map.dart';

import 'package:intl/intl.dart';

class DetailExtension extends StatelessWidget {
  DetailExtension(this.hotel);
  HotelInfo hotel;

  final List<ServiceTag> _listAmenitiesTags = ExampleData().getAmenitiesTags();

  @override
  Widget build(BuildContext context) {
    final _dtlTypeTextStyle =
        Theme.of(context).textTheme.subtitle2?.copyWith(color: kTagHotelColor);

    final _dtlTitleTextStyle = Theme.of(context).textTheme.headline2;
    final _dtlSubTitleTextStyle = Theme.of(context)
        .textTheme
        .headline5
        ?.copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w500);
    final _dtlSub1TextStyle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.w600);
    final _dtlBody1TextStyle = Theme.of(context)
        .textTheme
        .bodyText1
        ?.copyWith(color: kPrimaryDarkenColor, fontWeight: FontWeight.normal);

    return Padding(
      padding: PAD_SYM_H20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Text(hotel.type == HotelType.HOTEL ? '' : '',
                    style: _dtlTypeTextStyle),
                Spacer(),
              ],
            ),
          ),
          SIZED_BOX_H12,
          Text(hotel.name, style: _dtlTitleTextStyle),
          SIZED_BOX_H12,
          Row(
            children: [
              SIZED_BOX_W06,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: hotel.distance.toString(), style: _dtlSub1TextStyle),
                TextSpan(text: ' ', style: _dtlBody1TextStyle)
              ])),
              RawMaterialButton(
                  elevation: 0,
                  fillColor: Colors.lightBlue,
                  constraints: BoxConstraints(minHeight: 42, minWidth: 100),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Map()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    DTL_LOCATION_TEXT,
                  )),
              SIZED_BOX_W20,
              SIZED_BOX_W06,
              RichText(text: TextSpan(children: [])),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 20, 12),
              child: Text(DTL_SAMPLE_DESCRIPT_TEXT,
                  style: _dtlSub1TextStyle?.copyWith(
                      height: 1.5,
                      color: kSubTextColor,
                      fontWeight: FontWeight.normal)),
            ),
            Text(DTL_AMENITY_TEXT, style: _dtlSubTitleTextStyle),
          ])
        ],
      ),
    );
  }
}
