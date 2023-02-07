// import 'package:flutter/material.dart';
//
// class Suggestions extends StatelessWidget {
//   List<String> tagList = [
//     "All",
//     "Today",
//     "Continue watching",
//     "Unwatched",
//     "Trending",
//     "Live",
//     "Posts"
//   ];
//
//   List<Widget> getTags() {
//     List<Widget> tags = [];
//     for (int i = 0; i < tagList.length; i++) {
//       tags.add(
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
//           child: new ElevatedButton(
//             child: Text(
//               tagList[i],
//               style: TextStyle(
//                   fontSize: 12,
//                   fontFamily: "Helvetica",
//                   color: Colors.black,
//                   fontWeight: FontWeight.normal),
//             ),
//
//             //  color: Colors.grey,
//             // shape: RoundedRectangleBorder(
//             //   borderRadius: BorderRadius.circular(20.0),
//             //   side: BorderSide(color: Color(0xFF909090), width: 0.5)
//             // ),
//             style: ElevatedButton.styleFrom(
//               primary: Colors.grey[400],
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   side: BorderSide(color: Color(0xFF909090), width: 0.5)),
//             ),
//
//             onPressed: () {},
//           ),
//         ),
//       );
//     }
//     return tags;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: getTags(),
//       ),
//     );
//   }
// }
