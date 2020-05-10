import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/packageLib.dart';
import 'package:philanthroctor/widgets/caseTile.dart';

class HorizontalRow extends StatefulWidget {
  final String title;
  final String description;
  final AsyncSnapshot snapshot;
  HorizontalRow({this.title, this.description, this.snapshot});

  @override
  _HorizontalRowState createState() => _HorizontalRowState(
      rowtitle: this.title,
      rowdescription: this.description,
      rowsnapshot: this.snapshot);
}

class _HorizontalRowState extends State<HorizontalRow> {
  final String rowtitle;
  final String rowdescription;
  final AsyncSnapshot rowsnapshot;
  _HorizontalRowState({this.rowtitle, this.rowdescription, this.rowsnapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
        
        //
        height: 320,
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
              child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4, bottom: 8),
                child: Text(
                  this.rowtitle,
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 22,
                        fontFamily: GoogleFonts.roboto().toString(),
                        color: Colors.black87,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,  bottom: 4),
                child: Text(
                  this.rowdescription,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                      fontSize: 14,
                      fontFamily: GoogleFonts.roboto().toString(),
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
      ),
    ));
  }

  Widget _buildListView(AsyncSnapshot snapshot) {
    List<DocumentSnapshot> _list = snapshot.data.documents;

    return ListView.builder(
        shrinkWrap: true,
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
