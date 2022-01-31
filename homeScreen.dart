// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:myhostel/utils/constants.dart';
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   var SvgPicture;

//   get child => null;

//   Widget build(BuildContext context) {
//     return Scaffold(

// body: SafeArea(
//   child: Container(
//     width: double.infinity,
//     padding: EdgeInsets.only(left:20,top: 30),
//     child: SingleChildScrollView(
//       child: Column(
//         children: [
// //top bar
// Padding(
//   padding: PAD_ONLY_R20,
//   child: Row(
//     children: [
//       Image.asset("assets/images/logo.jpg", fit: BoxFit.cover)

//   ],),),
// SIZED_BOX_H20,

// //Search field
// Container(
//   margin: PAD_ONLY_R20,
//   padding: PAD_SYM_H20,
//   alignment: Alignment.centerLeft,
//   width: double.infinity,
//   height: 50,
//   decoration: BoxDecoration(
//     color: kBackgroundLightColor,
//     borderRadius: BorderRadius.circular(16),
//     boxShadow: [
// y      BoxShadow(
//         color: kShadowColor,
//         blurRadius: 20
//          )
//     ]
//   ),
// child: Row(
//   children: [
    
//     SIZED_BOX_W20,
//   //  Expanded(
//   //                       child: FocusScope(
//   //                         node: _scopeNode,
//   //                         child: TextField(
//   //                           autofocus: false,
//   //                           textAlignVertical: TextAlignVertical.center,
//   //                           keyboardType: TextInputType.name,
//   //                           style: _hmeInputTextStyle,
//   //                           expands: true,
//   //                           maxLines: null,
//   //                           decoration: InputDecoration(
//   //                               border: InputBorder.none,
//   //                               hintText: HME_HINT_SEARCH_TEXT),
//   //                         ),
//   //                       ),
//   //                     ),
//   ],),


// ),
// // service tags

// Padding(
//   padding:const EdgeInsets.fromLTRB(0, 30, 20, 30),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     // children: _examplesData
//     // .getServiceTags()
//     // .map((tag) => ButtonServiceTag(
//     //   name: tag.name,
//     //   iconUrl:tag.iconUrl,
//     //   color:tag.color
//     // ),
//     // .toList()),
//   ),
  
  
//   ),
//   //Nearby title
// Padding(
//   padding: PAD_ONLY_R20,
//   child: Row(
//     children: [
//    // Text(HME_HINT_SEARCH_TEXT,style:_hmeTitleTextStyle ),
//       Spacer(),
//       //SvgPicture.asset(_MORE_ICON)
//     ],), ),
// //List Card
// Container(
//   height: 320,
//   width: double.infinity,
//   alignment: Alignment.centerLeft,

//   child: ListView.separated(
//     shrinkWrap: true,
//     scrollDirection: Axis.horizontal, itemBuilder: (BuildContext context, int index) {  }, itemCount: null, separatorBuilder: (BuildContext context, int index) {  },
//     padding: EdgeInsets.only(top: 12,bottom: 30,right: 20),
//     //separatorBuilder: (context, index) => SIZED_BOX_W20,
// //itemCount: _exampleData.getHotelData().length,
//         //              itemBuilder: (_, index) => GestureDetector(
//           //                onTap: () => Navigator.push(
//                 //              context,
//                  //             MaterialPageRoute(
//                //                   builder: (context) => DetailScreen(
//                  //                     _exampleData.getHotelData()[index]))),
//   ),

// ),
//  // Inspiration Title
//                 Padding(
//                   padding: PAD_ONLY_R20,
//                   child: Row(
//                     children: [
//                     //  Text(HME_INSPIRATION_TEXT, style: _hmeTitleTextStyle),
//                       Spacer(),
//                     //  SvgPicture.asset(_MORE_ICON)
//                     ],
//                   ),
//                 ),

//     //inspiration
//     Padding(
//                   padding: PAD_ONLY_R20,
//                   child: Container(
//                       width: double.infinity,
//                       alignment: Alignment.centerLeft,
//                       child: ListView.separated(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.only(top: 12, bottom: 30),
//                         separatorBuilder: (context, index) => SIZED_BOX_H24,
//                         itemCount: _exampleData.getInspiration().length,
//                         itemBuilder: (context, index) => InspirationCard(
//                             _exampleData.getInspiration()[index]),
//                       )),
//                 ),

          

//         ],)
//        ,)
//   ),

  
//    ),
// bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: SizedBox(
//           height: 72,
//           child: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               currentIndex: _currentIndex,
//               backgroundColor: kBackgroundLightColor,
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               elevation: 0,
//               onTap: (index) => setState(() => _currentIndex = index),
//               items: _exampleData
//                   .getNavigationIcon()
//                   .map((icon) => BottomNavigationBarItem(
//                       icon: SvgPicture.asset(icon,
//                           color:
//                               _exampleData.getNavigationIcon().indexOf(icon) ==
//                                       _currentIndex
//                                   ? kPrimaryColor
//                                   : kUnseletedColor),
//                       label: ''))
//                   .toList()),
//         ),


//     );
//   }
// }
