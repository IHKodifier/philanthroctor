import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:philanthroctor/packageLib.dart';

class HorizontalRow extends StatefulWidget {
  final String title;
  final String description;
  HorizontalRow({this.title, this.description});

  @override
  _HorizontalRowState createState() => _HorizontalRowState(
      rowtitle: this.title, rowdescription: this.description);
}

class _HorizontalRowState extends State<HorizontalRow> {
  final String rowtitle;
  final String rowdescription;
  _HorizontalRowState({this.rowtitle, this.rowdescription});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 16),
              child: Text(
                this.rowtitle,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 16),
              child: Text(
                this.rowdescription,
                style: Theme.of(context).textTheme.subhead.copyWith(
                    fontSize: 14,
                    color: Colors.black38,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance.collection('cases').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //return valid builder
                      return _buildListView(snapshot);
                    } else {
                      return Text('no data');
                    }
                  }),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildListView(AsyncSnapshot snapshot) {
    List<DocumentSnapshot> _list = snapshot.data.documents;
    
    return ListView.builder(
        itemCount: _list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: CaseTile(
                docsnap: snapshot.data.documents[index],
              ),
            ),
          );
        });
  }
}