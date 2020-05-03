import 'package:philanthroctor/packageLib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:philanthroctor/widgets/kittystaus.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildDummyKittyWidget(),
            // _buildDummyCaseList(),
            // _buildActualKittyWidget(),
            // _buildActualCaseList(),
            StreamBuilder(
              stream: Firestore.instance.collection('cases').snapshots(),
              initialData: 'Loading',
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return Column(
                    children: <Widget>[
                      HorizontalRow(
                          title: 'Case Queue',
                          description: 'cases submitted by all Philanthroctors',
                          snapshot: snapshot),
                      HorizontalRow(
                          title: 'Case-Review Queue',
                          description:
                              'cases for review by all Philanthroctors',
                          snapshot: snapshot),
                      HorizontalRow(
                          title: 'Kitty Activity',
                          description: 'cases submitted by all Philanthroctors',
                          snapshot: snapshot)
                    ],
                  );
                }
              },
            ),
          ]),
    );
  }

  Widget _buildDummyKittyWidget() {
    return Material(
      elevation: 15,
      child: Container(child: KittyStatus()));
  }

  Widget _buildDummyCaseList() {
    return Container(
      height: 40,
      color: Colors.teal,
      child: Text(
        'dummy case list',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildActualKittyWidget() {
    return Container(
      height: 40,
      color: Colors.red,
      child: Text('actualkitty'),
    );
  }

  Widget _buildActualCaseList() {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      onTap: () {},
      child: Container(
        // color: Colors.pink.shade300,
        height: 200,
        width: 220,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffeeeeee),
              blurRadius: 15.0,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Card(
          elevation: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.purple,
                    // child: Container(height: 50,width: 50,color: Colors.deepOrange,)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Text(
                      // widget.docsnap.data['caseTitle'],
                      'Sakina ',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        // widget.docsnap.data['nokType'],
                        'wife of ',
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Text(
                      // widget.docsnap.data['nokTitle'],
                      'Murad',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
