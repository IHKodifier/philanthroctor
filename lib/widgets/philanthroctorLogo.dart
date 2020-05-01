import 'package:philanthroctor/packageLib.dart';
import 'package:google_fonts/google_fonts.dart';

class PhilanthroctorLogo extends StatelessWidget {
  const PhilanthroctorLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            'Philanthroctor',
            style: GoogleFonts.shadowsIntoLight(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 46.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
