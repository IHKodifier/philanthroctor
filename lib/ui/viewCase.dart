import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/packageLib.dart';

class ViewCase extends StatefulWidget {
  final String caseID;
  ViewCase({this.caseID});
  @override
  _ViewCaseState createState() => _ViewCaseState();
}

class _ViewCaseState extends State<ViewCase> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Case',
          style: GoogleFonts.dancingScript(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildDummyBodyContainer(context, _theme),
    );
  }

  _buildActualBodyContainer(BuildContext context, ThemeData theme) {
    //   AsyncSnapshot qsnap= Firestore.instance.collection('cases').where('uid',isEqualTo: widget.caseID).snapshots();
    //   return ListView(
    //     padding: EdgeInsets.all(8),
    //     children: <Widget>[
    //       Text(
    //         ,
    //         style: theme.textTheme.title,
    //       )
    //     ],
    //   );
  }
  Widget _buildDummyBodyContainer(BuildContext context, ThemeData theme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(child: Icon(Icons.account_circle),),
          Text('Shakir Inam',style: theme.textTheme.title.copyWith(color: theme.primaryColor),),
        ],
      ),
    );
  }
}
