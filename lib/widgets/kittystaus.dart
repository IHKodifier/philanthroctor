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
            color: Colors.green.shade50,
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
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lobster().toString(),
                              letterSpacing: 1.2)),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Grand Total (PKR): ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .title
                              .copyWith(color: Colors.black87, fontSize: 12),
                          children: [
                            TextSpan(
                              text: '1,856,546.00',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Added Today: ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .title
                              .copyWith(color: Colors.black87, fontSize: 12),
                          children: [
                            TextSpan(
                              text: '1,850.00',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                     RichText(
                      text: TextSpan(
                          text: 'Added this week : ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .title
                              .copyWith(color: Colors.black87, fontSize: 12),
                          children: [
                            TextSpan(
                              text: '39,800.00',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                     RichText(
                      text: TextSpan(
                          text: 'Added this month: ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .title
                              .copyWith(color: Colors.black87, fontSize: 12),
                          children: [
                            TextSpan(
                              text: '350,000.00',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                            ),
                          ]),
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
