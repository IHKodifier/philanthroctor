import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  ScrollController _scrollController;

//data Strings
  String _caseTitle, _age, _nic, _city, _phone, _requiredService;
  double _costSliderValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _localTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Case',
          style: GoogleFonts.dancingScript(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _buildBioDataForm(_localTheme),
              ),
          SizedBox(height: 30   ,),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Colors.black,
                  child: Container(
                    // color: Colors.deepOrange,
                    width: 350.0,
                    height: 400.0,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Material _buildBioDataForm(ThemeData localTheme) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Personal details',
                style: localTheme.textTheme.caption.copyWith(fontSize: 16),
              ),
              _buildCaseTiltleTextFormField(localTheme),
              _buildNICTextFormField(localTheme),
              _buildAgeTextFormField(localTheme),
              // _buildPhoneNumber(localTheme),
              // _buildRequiredServiceTextFormField(localTheme),
              // _buildRequiredSericeCost(localTheme),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildCaseTiltleTextFormField(ThemeData localTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 22),
        controller: _caseTitleController,
        decoration: InputDecoration(
          icon: FaIcon(FontAwesomeIcons.solidUserCircle),
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
          icon: FaIcon(FontAwesomeIcons.idCard),
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
         icon: FaIcon(FontAwesomeIcons.calendarDay),
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
          icon: FaIcon(FontAwesomeIcons.cog),
          hintText: 'Required Health Service/Procedure',
          labelText: 'Service ',
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

  Widget _buildRequiredSericeCost(ThemeData localTheme) {
    return Column(
      children: <Widget>[
        Text(
          'Required Service Cost',
          style: localTheme.textTheme.subhead.copyWith(fontSize:16,color: Colors.black54),
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _costSliderValue,
              min: 0,
              max: 120000,
              divisions: 8,
              label: _costSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _costSliderValue = newval;
                });
              }),
        ),
        Text(
          _costSliderValue.toStringAsFixed(0),
          style: localTheme.textTheme.title,
        ),
      ],
    );
  }
Widget _buildPhoneNumber(ThemeData localTheme){
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 22),
        controller: _caseTitleController,
        decoration: InputDecoration(
         icon: FaIcon(FontAwesomeIcons.phone),
          hintText: 'Enter mobile phone number ',
          // labelText: 'Phone number ',
          labelStyle: localTheme.textTheme.title.copyWith(
            color: localTheme.primaryColor,
            fontSize: 16.0,
          ),
          hintStyle: localTheme.textTheme.subhead.copyWith(
            fontSize: 16.0,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ))));
}
}
