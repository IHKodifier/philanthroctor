import 'package:philanthroctor/packageLib.dart';
import 'package:philanthroctor/widgets/kittystaus.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              KittyStatus(),
              //  Text('debug text',style: TextStyle(color:Theme.of(context).primaryColor),),
              //  Card(elevation: 5,
              //  color: Colors.green[900],
              //  child: ListTile(leading: Text('leading'),),),
              ListView(
                shrinkWrap: true, 
                children: <Widget>[
                Card(
                  elevation: 5,
                  color: Theme.of(context).cardColor,
                  child: _buildListTile(
                      context, 'Mrs Sultan Zakat', '28,000', '20 Apr 2020'),
                ),
                Card(
                  elevation: 5,
                  color: Theme.of(context).cardColor,
                  child: _buildListTile(
                      context, 'Nasir Mehmood', '100,000', '03 Apr 2020'),
                ),
                Card(
                  elevation: 5,
                  color: Theme.of(context).cardColor,
                  child: _buildListTile(
                      context, 'Mrs Sultan Zakat', '28,000', '2 Feb 2020'),
                ),
                Card(
                  elevation: 5,
                  color: Theme.of(context).cardColor,
                  child: _buildListTile(
                      context, 'Mrs Sultan Zakat', '28,000', '11 Jan 2020'),
                ),
                Card(
                  elevation: 5,
                  color: Theme.of(context).cardColor,
                  child: _buildListTile(
                      context, 'Mrs Sultan Zakat', '28,000', '25 Dec 2019'),
                ),
                Card(
                elevation: 5,
                color: Theme.of(context).cardColor,
                child: _buildListTile(
                    context, 'Mrs Sultan Zakat', '28,000', '20 Apr 2020'),
              ),
                
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String leading, String title, String trailing) {
    return ListTile(
      leading: Text(
        leading,
        style: Theme.of(context).textTheme.title.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
            ),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .title
            .copyWith(color: Colors.black, fontSize: 18),
      ),
      trailing: Text(
        trailing,
        style: Theme.of(context)
            .textTheme
            .subtitle
            .copyWith(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
