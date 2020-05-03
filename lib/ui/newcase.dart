import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/packageLib.dart';

class NewCase extends StatefulWidget {
  @override
  _NewCaseState createState() => _NewCaseState();
}

class _NewCaseState extends State<NewCase> {
  TextEditingController _caseTitleController, _ageController, _nicController;

  String _caseTitle, _age, _nic, _city, _phone;

  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Case',
          style: GoogleFonts.dancingScript(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCaseTiltleTextFormField(localTheme),
            _buildNICTextFormField(localTheme),
            _buildAgeTextFormField(localTheme),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: _buildButtonBar(localTheme),
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildCaseTiltleTextFormField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.robotoCondensed(color: Colors.black, fontSize: 22),
        controller: _caseTitleController,
        decoration: InputDecoration(
          hintText: 'Enter name of Case / Patient',
          labelText: 'Name ',
          labelStyle: localTheme.textTheme.title.copyWith(
            color: localTheme.primaryColor,
            fontSize: 16.0,
          ),
          hintStyle: localTheme.textTheme.subhead.copyWith(
            fontSize: 16.0,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
        onChanged: (value) {
          _caseTitle = value;
        },
      ),
    );
  }

  Widget _buildNICTextFormField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.robotoCondensed(color: Colors.black, fontSize: 22),
        keyboardType: TextInputType.number,
        controller: _nicController,
        decoration: InputDecoration(
          hintText: 'National Identity Card #',
          labelText: 'NIC',
          labelStyle: localTheme.textTheme.title.copyWith(
            color: localTheme.primaryColor,
            fontSize: 16.0,
          ),
          hintStyle: localTheme.textTheme.subhead.copyWith(
            fontSize: 16.0,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
        onChanged: (value) {
          _nic = value;
        },
      ),
    );
  }

  Widget _buildAgeTextFormField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.robotoCondensed(color: Colors.black, fontSize: 22),
        controller: _ageController,
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          hintText: 'Age of the case / Patient',
          labelText: 'Age',
          labelStyle: localTheme.textTheme.title.copyWith(
            color: localTheme.primaryColor,
            fontSize: 16.0,
          ),
          hintStyle: localTheme.textTheme.subhead.copyWith(
            fontSize: 16.0,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
        onChanged: (value) {
          _age = value;
        },
      ),
    );
  }

  Widget _buildButtonBar(ThemeData localTheme) {
    return ButtonBar(
        mainAxisSize: MainAxisSize.max,
        layoutBehavior: ButtonBarLayoutBehavior.padded,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.black45),
                )),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
              child: RaisedButton(
                color: localTheme.accentColor,
                child: Text(
                  'SAVE',
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: _onSaveButtonPressed,
              )),
        ]);
  }

  void _onSaveButtonPressed() async {
    Firestore.instance.collection('cases').add({
      'NIC': _nic,
      'age': _age,
      'caseTitle': _caseTitle,
      'timestamp': DateTime.now().toString()
    }).then((value) {
      Navigator.of(context).pop();
    });
  }
}
