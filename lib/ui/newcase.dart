import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/packageLib.dart';

class NewCase extends StatefulWidget {
  @override
  _NewCaseState createState() => _NewCaseState();
}

class _NewCaseState extends State<NewCase> with SingleTickerProviderStateMixin {
  //Text editing Controllers
  TextEditingController _caseTitleController,
      _ageController,
      _nicController,
      _requiredServiceController;

//data Strings
  String _caseTitle, _age, _nic, _city, _phone, _requiredService;

// Tabs Lists
  List<Tab> _tabs;
  List<Widget> _tabViews;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(
        child: Text('personal info',
            // style: TextStyle(color: Colors.black, fontSize: 12),
            ),
        icon: Icon(
          Icons.person,
          size: 25,
          // color: Colors.black,
        ),
      ),
      Tab(
        child: Text(
          'Family  info',
          // style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        icon: Icon(
          Icons.people,
          size: 25,
          // color: Colors.black,
        ),
      ),
      Tab(
        child: Text(
          'Income',
          // style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        icon: Icon(
          Icons.account_balance_wallet,
          size: 25,
          // color: Colors.black,
        ),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    _tabViews = [
      Container(
          child: Center(
              child: _buildBioDataForm(localTheme),
              )),
      Container(
        child: Center(
            child: Text(
          'Details about Family',
          style: TextStyle(color: Colors.black87, fontSize: 28),
        )),
      ),
      Container(
        child: Center(
            child: Text(
          'Income',
          style: TextStyle(color: Colors.black, fontSize: 28),
        )),
      ),
    ];
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: _tabs,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 6,
            indicatorPadding: EdgeInsets.only(bottom: 4),
          ),
          title: Text(
            'New Case',
            style: GoogleFonts.dancingScript(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(child: TabBarView(children: _tabViews)),
        ),
      ),
    );
  }

  Form _buildBioDataForm(ThemeData localTheme) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCaseTiltleTextFormField(localTheme),
        _buildNICTextFormField(localTheme),
        _buildAgeTextFormField(localTheme),
        _buildRequiredServiceTextFormField(localTheme),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 90,
          child: _buildButtonBar(localTheme),
        ),
      ],
    ));
  }

  Widget _buildCaseTiltleTextFormField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 22),
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
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 22),
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
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 22),
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
                color: localTheme.primaryColor,
                child: Text(
                  'Save ',
                  style: TextStyle(color: Colors.white,fontSize: 18),
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
      'timestamp': DateTime.now().toString(),
      'requiredService': _requiredService,
    }).then((value) {
      Navigator.of(context).pop();
    });
  }

  Widget _buildRequiredServiceTextFormField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 22),
        controller: _requiredServiceController,
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          hintText: 'Required Health Service/Procedure',
          labelText: 'Service',
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
          _requiredService = value;
        },
      ),
    );
  }
}
