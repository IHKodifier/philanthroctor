import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/packageLib.dart';
import 'package:flutter/material.dart';

class KittyStatus extends StatefulWidget {
  @override
  _KittyStatusState createState() => _KittyStatusState();
}

class _KittyStatusState extends State<KittyStatus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
    borderRadius: BorderRadius.circular(25),
    child: Material(
      elevation: 25,
      child: Container(
        height: 180,
        // color: Colors.green.shade50,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Kitty Status',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.lobster().toString(),
                          letterSpacing: 1.2)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Grand Total (PKR): ',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(color: Colors.black87, fontSize: 14),
                    ),
                    Text(
                      '1,856,546.00',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Added Today (PKR):  ',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(color: Colors.black87, fontSize: 14),
                    ),
                    Text(
                      '1,211.00',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Added this week  (PKR): ',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(color: Colors.black87, fontSize: 14),
                    ),
                    Text(
                      '34,850.00',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Added this month (PKR):  ',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(color: Colors.black87, fontSize: 14),
                    ),
                    Text(
                      '184,600.00',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ]),
        ),
      ),
    ),
        ),
      );
    // );
  }
}
