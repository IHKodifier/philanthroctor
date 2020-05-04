// import 'package:philanthroctor/packageLib.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:philanthroctor/widgets/kittystaus.dart';
// import 'dart:math';

// class UserHome extends StatefulWidget {
//   @override
//   _UserHomeState createState() => _UserHomeState();
// }

// class _UserHomeState extends State<UserHome> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           _buildDummyKittyWidget(),
//           _buildDummyCaseList(),
//           _buildActualKittyWidget(),
//           _buildActualCaseList(),
         
//         ]);
//   }

//   Widget _buildDummyKittyWidget() {
//     return KittyStatus();
//   }

//   Widget _buildDummyCaseList() {
//     return Container(
//       height: 40,
//       color: Colors.teal,
//       child: Text(
//         'dummy case list',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }

//   Widget _buildActualKittyWidget() {
//     return Container(
//       height: 40,
//       color: Colors.red,
//       child: Text('actualkitty'),
//     );
//   }

//   Widget _buildActualCaseList() {
//     // String _photoUrl = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
//     // _photoUrl += Random().nextInt(400).toString();33
//     return InkWell(
//       splashColor: Theme.of(context).accentColor,
//       onTap: () {},
//       child: Container(
//         // color: Colors.pink.shade300,
//         height: 200,
//         width: 220,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xffeeeeee),
//               blurRadius: 15.0,
//               spreadRadius: 3,
//             ),
//           ],
//         ),
//         child: Card(
//           elevation: 15,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, bottom: 8),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Container(
//                     height: 100,
//                     width: 100,
//                     child: Image.network(
//                       _photoUrl,
//                       height: 100,
//                       fit: BoxFit.scaleDown,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Wrap(
//                   alignment: WrapAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       // widget.docsnap.data['caseTitle'],
//                       'Sakina ',
//                       style: Theme.of(context)
//                           .textTheme
//                           .title
//                           .copyWith(fontSize: 16),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       child: Text(
//                         // widget.docsnap.data['nokType'],
//                         'wife of ',
//                         style: Theme.of(context).textTheme.subtitle.copyWith(
//                             fontSize: 12, fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                     Text(
//                       // widget.docsnap.data['nokTitle'],
//                       'Murad',
//                       style: Theme.of(context)
//                           .textTheme
//                           .title
//                           .copyWith(fontSize: 16),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
