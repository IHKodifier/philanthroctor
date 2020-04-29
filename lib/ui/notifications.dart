import 'package:philanthroctor/packageLib.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red[50],
      child: Center(
        child: Text(
          'Notifcation',
          style: Theme.of(context).textTheme.title.copyWith(fontSize: 54.0),
        ),
      ),
    );
  }
}
