import 'package:flutter/material.dart';
import 'package:myhostel/others/level2/example_data.dart';
import 'package:myhostel/others/level2/constants.dart';
import 'package:myhostel/others/level2/detail_screen.dart';
import 'package:myhostel/others/level2/booking_card.dart';
import 'package:myhostel/others/level4/button_service_tag.dart';
import 'package:myhostel/others/level2/inspiration_card.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//myhostel\others\level2\constants.dart

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusScopeNode _scopeNode = FocusScopeNode();
  final ExampleData _exampleData = ExampleData();
  int _currentIndex = 0;
  final _textController = TextEditingController();
  String college = '';

  static const _LOGO_BOOKING = 'assets/icons/home_screen/bp_logo.svg';
  static const _AVATAR_IMAGE = 'assets/images/bp_avatar.png';
  static const _SEARCH_ICON = 'assets/icons/home_screen/bp_search_icon.svg';
  static const _MORE_ICON = 'assets/icons/home_screen/bp_more_icon.svg';
  @override
  Widget build(BuildContext context) {
    final _hmeTitleTextStyle = Theme.of(context)
        .textTheme
        .headline3
        ?.copyWith(color: kPrimaryDarkenColor);

    final _hmeInputTextStyle = Theme.of(context).textTheme.subtitle2;

    return Scaffold(
      appBar: AppBar(
        // title: Text('kizito'),
        leading: Icon(Icons.menu),
        title: Text('MY HOSTELS'),
        actions: [
          //Icon(Icons.favorite),
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.deepOrange,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SIZED_BOX_H20,
                // Text(college),
                // Search Field
                Container(
                  margin: PAD_ONLY_R20,
                  padding: PAD_SYM_H20,
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kBackgroundLightColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: kShadowColor,
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Row(
                    children: [
                      SIZED_BOX_W20,
                      Expanded(
                        child: FocusScope(
                          node: _scopeNode,
                          child: TextField(
                            controller: _textController,
                            autofocus: false,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.name,
                            style: _hmeInputTextStyle,
                            expands: true,
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: HME_HINT_SEARCH_TEXT),
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            college = _textController.text;
                            //  Text(college);
                            // near(college);
                            //calli();
                          });
                        },
                        child: Text(
                          'Enter',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                // Text(college);
                // Nearby Title
                Padding(
                    padding: PAD_ONLY_R20,
                    child: Row(
                      children: [
                        Spacer(),
                        Text(HME_NEARBY_TEXT, style: _hmeTitleTextStyle),
                        Spacer(),
                      ],
                    )),

                Padding(
                  //Text(college);
                  padding: PAD_ONLY_R20,
                  child: Row(
                    children: [
                      // Text(college),
                      // near(college),
                      //calli(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (college == 'cocis') ...[
                            const Icon(
                              Icons.house,
                              size: 100,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                      'COCIS IS NEARER TO APEX HOSTEL \n check it out in the list',
                                      style: _hmeTitleTextStyle),
                                  Spacer(),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ] else if (college == 'cedat') ...[
                            const Icon(
                              Icons.hotel_sharp,
                              size: 100,
                              color: Colors.black,
                            ),
                            Text(
                                'CEDAT IS NEARER TO KANN HOSTEL \n check it out in the list'),
                          ] else if (college == 'chuss') ...[
                            const Icon(
                              Icons.access_alarm,
                              size: 100,
                              color: Colors.black,
                            ),
                            Text(
                                'CHUSS IS NEARER TO KARE HOSTEL \n check it out in the list'),
                          ] else if (college == 'chs') ...[
                            const Icon(
                              Icons.car_rental,
                              size: 100,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                            ),
                            Text(
                                'CHS IS NEARER TO GARDEN GROOVE HOSTEL \n check it out in the list'),
                          ] else
                            ...[],
                        ],
                      ),
                    ],
                  ),
                ),

                // List Card
                Container(
                    height: 320,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top: 12, bottom: 30, right: 20),
                      separatorBuilder: (context, index) => SIZED_BOX_W20,
                      itemCount: _exampleData.getHotelData().length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      _exampleData.getHotelData()[index]))),
                          child:
                              BookingCard(_exampleData.getHotelData()[index])),
                    )),

                // Inspiration Title
                Padding(
                  padding: PAD_ONLY_R20,
                  child: Row(
                    children: [
                      Text(HME_INSPIRATION_TEXT, style: _hmeTitleTextStyle),
                      Spacer(),
                    ],
                  ),
                ),

                // Inspiration
                Padding(
                  padding: PAD_ONLY_R20,
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 12, bottom: 30),
                        separatorBuilder: (context, index) => SIZED_BOX_H24,
                        itemCount: _exampleData.getInspiration().length,
                        itemBuilder: (context, index) => InspirationCard(
                            _exampleData.getInspiration()[index]),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 72,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: 'contact us'),
            ],
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.deepOrange,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  //near(String college) {
  // if
  // }

}
