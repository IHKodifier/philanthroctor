import 'package:philanthroctor/packageLib.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.teal[400],
      child: Center(
        child: Text('Dashboard Page ',style: Theme.of(context).textTheme.display1,)
        // Column(
        //   children: <Widget>[
        //     // Image.asset('/assets/images/dashboard.png'),
        //     RichText(
        //       text: TextSpan(
        //         text: 'Quota information ',
        //         style: Theme.of(context).textTheme.title.copyWith(
        //             color: Colors.white,
        //             fontSize: 18.0,
        //             fontStyle: FontStyle.italic),
        //         children: <TextSpan>[
        //           TextSpan(
        //               text: '87,500',
        //               style: TextStyle(
        //                   fontSize: 48.0,
        //                   fontWeight: FontWeight.bold,
        //                   fontStyle: FontStyle.normal)),
        //           TextSpan(text: ' of '),
        //           TextSpan(
        //               text: '160,000',
        //               style: TextStyle(
        //                   fontSize: 48.0,
        //                   fontWeight: FontWeight.bold,
        //                   fontStyle: FontStyle.normal)),
        //           TextSpan(
        //               text: '  renewed monthly every 1st of the month',
        //               style: TextStyle(
        //                 fontStyle: FontStyle.normal,
        //                 fontSize: 12.0,
        //               )),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
