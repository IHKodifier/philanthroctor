// // import 'package:philanthroctor/main.dart';
// import 'package:philanthroctor/packageLib.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:philanthroctor/ui/horizontal_list_View.dart';
// import 'package:philanthroctor/widgets/kittystaus.dart';

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
//     return StreamBuilder(
//         stream: Firestore.instance.collection('Cases').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return buildProgressIndicator(context);
//           } else {
//             return ListView(
//               children: <Widget>[
//                 SizedBox(height: 5),
//                 KittyStatus(),
//                Text('HELOO'),
//               ],
//             );
//           }
//         });
//   }

//   Center buildProgressIndicator(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 350,
//         child: Column(
//           children: <Widget>[
//             Text(
//               '...Loading Data...',
//               style: Theme.of(context).textTheme.headline.copyWith(
//                     fontSize: 22,
//                     fontStyle: FontStyle.italic,
//                     color: Colors.black54,
//                   ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             CircularProgressIndicator(),
//             SizedBox(
//               height: 40,
//             ),
//             Text(
//               'Please wait...',
//               style: Theme.of(context).textTheme.headline.copyWith(
//                     fontSize: 22,
//                     fontStyle: FontStyle.italic,
//                     color: Colors.black54,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
