// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:philanthroctor/packageLib.dart';

class AppMessage extends StatefulWidget {
  @override
  _AppMessageState createState() => _AppMessageState();
}

class _AppMessageState extends State<AppMessage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chat History',
    style: Theme.of(context).textTheme.display1,
    ));
  }
}
