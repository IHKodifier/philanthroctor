// import 'package:/packageLib.dart';
import 'package:philanthroctor/packageLib.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
//   List<HfCase> _cases;
//   FirestoreService fireServ = new FirestoreService();
//   StreamSubscription<QuerySnapshot> _caseStream;

//   @override
//   void initState() {
//     super.initState();
//     _cases = new List();
//     // _caseStream?.cancel();
//     _caseStream = fireServ.getCaseList().listen((QuerySnapshot snapshot) {
//       final List<HfCase> caseList = snapshot.documents
//           .map((documentsnapshot) => HfCase.fromMap(documentsnapshot.data))
//           .toList();
//       setState(() {
//         _cases = caseList;
//       });
//     });
//     // _caseStream.onData(build(context));
//   }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue[100],);
//     return StreamBuilder(
//         stream: Firestore.instance.collection('Cases').snapshots(),
        
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CircularProgressIndicator(),
//                   Text('...Loading Data...'),
//                   Text('Please wait...')
//                 ],
//               ),
//             );
//           } else {
//             return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot _myCase = snapshot.data.documents[index];
//                     String _casetitle = _myCase['caseTitle'];
//                     return Material(
//                       elevation: 15.0,
//                         color: Colors.white70,
//                         child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           // decoration: BoxDecoration(color: Colors.teal,
//                           // margin: EdgeInsets.only(bottom: 8.0),
//                           child: ExpansionTile(
//                               backgroundColor: Colors.red[50],
//                               leading: CircleAvatar(
//                                 child: Icon(Icons.account_circle, size: 40.0),
//                               ),
//                               title: Column(
//                                 children: <Widget>[
//                                   SizedBox(height: 10.0),
//                                   Text(_casetitle,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .title
//                                           .copyWith(fontSize: 16.0)),
//                                 ],
//                               ),
//                               children: <Widget>[
//                                 Text('text goes here',
//                                     style: Theme.of(context).textTheme.title),
//                                 Text('text goes here',
//                                     style: Theme.of(context).textTheme.title),
//                                 CircleAvatar(
//                                   child: Icon(Icons.account_circle, size: 40.0),
//                                 ),
//                               ]),
//                         ),
//                       ),
//                     );
//                   },
//                 ));
//           }
//         });
  }
}
