import 'package:philanthroctor/packageLib.dart';
import 'package:philanthroctor/services/userManagement.dart';
import 'package:flutter/widgets.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2.0,
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            // colo
            // margin: EdgeInsets.all(4.0),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.all(4.0),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            accountName: new Text(
              'Dr. Asad Nouman Durrani ',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 18, color: Colors.white),
            ),
            accountEmail: new Text('@AsadNoman'),
          ),
          new ListTile(
            title: new Text('About Page'),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.push(
              //     context,
              //     new MaterialPageRoute(
              //         builder: (BuildContext context) => new AboutPage()));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:64.0, vertical: 32),
            child: RaisedButton(
              onPressed: () {
                UserManagement().signOut();
                Navigator.popAndPushNamed(context, '/login');
              },
              child: Text('Sign Out'),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
