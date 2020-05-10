import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
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

//data Strings and slider values
  String _caseTitle, _age, _nic, _city, _phone, _requiredService;
  double _costSliderValue = 0,
      _familySizeSliderValue = 0,
      _familySizeUnder18SliderValue = 0,
      _familySizeOver65SliderValue = 0,
      _familyHeadIncomeSliderValue = 0,
      _familyOtherIncomeSliderValue = 0,
      _familyKitchenExpenseSliderValue = 0,
      _familyEducationExpenseSliderValue = 0,
      _familyUtilitiesExpenseSliderValue = 0,
      _familyResidentialExpenseSliderValue = 0,
      _familyHealthcareExpenseSliderValue = 0;

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
                child: _buildBioDataCard(_localTheme),
              ),
              SizedBox(
                height: 15,
              ),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Colors.black,
                  child: Container(
                    child: _buildServiceDetailCard(_localTheme),
                  )),
              SizedBox(
                height: 15,
              ),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Colors.black,
                  child: Container(
                    child: _buildFamilyDetailCard(_localTheme),
                  )),
              SizedBox(
                height: 15,
              ),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Colors.black,
                  child: Container(
                    child: _buildFamilyIncomeExpenseCard(_localTheme),
                  )),
              _buildButtonBar(_localTheme),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material _buildBioDataCard(ThemeData localTheme) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24),
      child: Container(
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
              SizedBox(
                height: 10,
              ),
              _buildCaseTiltleTextFormField(localTheme),
              _buildNICTextFormField(localTheme),
              _buildAgeTextFormField(localTheme),
              _buildPhoneNumber(localTheme),
              //
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
          icon: FaIcon(FontAwesomeIcons.solidAddressCard),
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
      'city': _city,
      'phoneNumber':_phone,
      'procedureCost': _costSliderValue,
      'familySize': _familySizeSliderValue,
      'familySizeUnder18': _familySizeUnder18SliderValue.toInt(),
      'familySizeOver65': _familySizeOver65SliderValue.toInt(),
      'familHeadIncome': _familyHeadIncomeSliderValue.toInt(),
      'familyOtherIncome': _familyOtherIncomeSliderValue.toInt(),
      'Kitchen expenses': _familyKitchenExpenseSliderValue.toInt(),
      'Education Expenses': _familyEducationExpenseSliderValue.toInt(),
      'Utilities expenses': _familyUtilitiesExpenseSliderValue.toInt(),
      'Residential expenses': _familyResidentialExpenseSliderValue.toInt(),
      'Health expenses': _familyHealthcareExpenseSliderValue.toInt(),
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
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: FaIcon(FontAwesomeIcons.procedures),
          hintText: ' Health Procedure',
          labelText: 'procedure/ service ',
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
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: _costSliderValue);
    fmf.amount = _costSliderValue;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'estimated Cost : ',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              fmf.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _costSliderValue,
              min: 0,
              max: 120000,
              // divisions: 12,
              label: _costSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _costSliderValue = newval;
                  fmf.amount = newval;
                });
              }),
        ),
      ],
    );
  }

  Widget _buildPhoneNumber(ThemeData localTheme) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            style: GoogleFonts.roboto(color: Colors.black, fontSize: 22),
            controller: _caseTitleController,
            onChanged: (newval) {
              setState(() {
                _phone = newval;
              });
            },
            decoration: InputDecoration(
                icon: FaIcon(FontAwesomeIcons.mobile),
                hintText: 'Enter mobile phone number ',
                labelText: 'Phone ',
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

  Widget _buildServiceDetailCard(ThemeData localTheme) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Service details',
                style: localTheme.textTheme.caption.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              _buildRequiredServiceTextFormField(localTheme),
              _buildRequiredSericeCost(localTheme),
              // _buildCaseTiltleTextFormField(localTheme),
              // _buildNICTextFormField(localTheme),
              // _buildAgeTextFormField(localTheme),
              // _buildPhoneNumber(localTheme),
              // _buildRequiredServiceTextFormField(localTheme),
              // _buildRequiredSericeCost(localTheme),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildFamilyDetailCard(ThemeData localTheme) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Family details...',
                style: localTheme.textTheme.caption.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              _buildFamilySize(localTheme),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildFamilyIncomeExpenseCard(ThemeData localTheme) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'INCOME vs EXPENSES',
                style: localTheme.textTheme.caption.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              _buildIncomeExpenseSlidersColumn(localTheme),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildFamilySize(ThemeData localTheme) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Family size: ',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              _familySizeSliderValue.toStringAsFixed(0),
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
            value: _familySizeSliderValue,
            min: 0,
            max: 12,
            // divisions: 12,
            label: _familySizeSliderValue.toStringAsFixed(0),
            onChanged: (newval) {
              setState(() {
                _familySizeSliderValue = newval;
              });
            },
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Members UNDER 18 yrs ',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              _familySizeUnder18SliderValue.toStringAsFixed(0),
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familySizeUnder18SliderValue,
              min: 0,
              max: 12,
              // divisions: 12,
              label: _familySizeUnder18SliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familySizeUnder18SliderValue = newval;
                  // fmf.amount = newval;
                });
              }),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Members Over 65 yrs',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              _familySizeOver65SliderValue.toStringAsFixed(0),
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familySizeOver65SliderValue,
              min: 0,
              max: 12,
              // divisions: 12,
              label: _familySizeOver65SliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familySizeOver65SliderValue = newval;
                  // fmf.amount = newval;
                });
              }),
        ),
      ],
    );
  }

  Widget _buildIncomeExpenseSlidersColumn(ThemeData localTheme) {
    var fmf = FlutterMoneyFormatter(amount: _familyHeadIncomeSliderValue);
    var fmfOtherIncome =
        FlutterMoneyFormatter(amount: _familyOtherIncomeSliderValue);
    var fmfKitchenExpense =
        FlutterMoneyFormatter(amount: _familyKitchenExpenseSliderValue);
    var fmfEducationExpense =
        FlutterMoneyFormatter(amount: _familyEducationExpenseSliderValue);
    var fmfResidentialExpense =
        FlutterMoneyFormatter(amount: _familyResidentialExpenseSliderValue);
    var fmfHealthcareExpense =
        FlutterMoneyFormatter(amount: _familyHealthcareExpenseSliderValue);
    var fmfUtilityExpense =
        FlutterMoneyFormatter(amount: _familyUtilitiesExpenseSliderValue);
    return Column(
      children: <Widget>[
        // FAMILY-HEAD INCOME
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Monthly Income(Family Head)',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              fmf.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),

        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
            value: _familyHeadIncomeSliderValue,
            min: 0,
            max: 120000,
            label: _familyHeadIncomeSliderValue.toStringAsFixed(0),
            onChanged: (newval) {
              setState(() {
                _familyHeadIncomeSliderValue = newval;
              });
            },
          ),
        ),
        SizedBox(
          height: 30,
        ),

        // OTHER-FAMILY-INCOME
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Text(
                  'Other Family members Income',
                  style: localTheme.textTheme.subhead
                      .copyWith(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            Text(
              fmfOtherIncome.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familyOtherIncomeSliderValue,
              min: 0,
              max: 50000,
              // divisions: 25,
              label: _familyOtherIncomeSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familyOtherIncomeSliderValue = newval;
                  fmf.amount = newval;
                });
              }),
        ),
        SizedBox(
          height: 30,
        ),
        // KTCHEN EXPENSE SLIDER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Kitchen  expenses',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              fmfKitchenExpense.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familyKitchenExpenseSliderValue,
              min: 0,
              max: 20000,
              // divisions: 20,
              label: _familyKitchenExpenseSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familyKitchenExpenseSliderValue = newval;
                  // fmf.amount = newval;
                });
              }),
        ),
        SizedBox(height: 30),
//UTILITIES EXPENSE SLIDER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Utilities expenses',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              fmfUtilityExpense.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familyUtilitiesExpenseSliderValue,
              min: 0,
              max: 20000,
              label: _familyUtilitiesExpenseSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familyUtilitiesExpenseSliderValue = newval;
                  fmfUtilityExpense.amount = newval;
                });
              }),
        ),
        SizedBox(height: 30),

//Residential Expenses
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Housing /Rent expenses',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              fmfResidentialExpense.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familyResidentialExpenseSliderValue,
              min: 0,
              max: 40000,
              label: _familyResidentialExpenseSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familyResidentialExpenseSliderValue = newval;
                  fmfResidentialExpense.amount = newval;
                });
              }),
        ),
        SizedBox(height: 30),

//Healthcare expense slider
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Health  expenses',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              fmfHealthcareExpense.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familyHealthcareExpenseSliderValue,
              min: 0,
              max: 40000,
              label: _familyHealthcareExpenseSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familyHealthcareExpenseSliderValue = newval;
                  fmfHealthcareExpense.amount = newval;
                });
              }),
        ),
        SizedBox(height: 30),
//Education expenses
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Education expenses',
              style: localTheme.textTheme.subhead
                  .copyWith(fontSize: 16, color: Colors.black54),
            ),
            Text(
              fmfEducationExpense.output.withoutFractionDigits,
              style: localTheme.textTheme.title,
            ),
          ],
        ),
        SliderTheme(
          data: localTheme.sliderTheme,
          child: Slider(
              value: _familyEducationExpenseSliderValue,
              min: 0,
              max: 25000,
              label: _familyEducationExpenseSliderValue.toStringAsFixed(0),
              onChanged: (newval) {
                setState(() {
                  _familyEducationExpenseSliderValue = newval;
                  fmfHealthcareExpense.amount = newval;
                });
              }),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
