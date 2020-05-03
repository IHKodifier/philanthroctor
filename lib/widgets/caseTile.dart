import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:philanthroctor/packageLib.dart';

class CaseTile extends StatefulWidget {
  final DocumentSnapshot docsnap;
  CaseTile({this.docsnap});
  @override
  _CaseTileState createState() => _CaseTileState();
}

class _CaseTileState extends State<CaseTile> {
  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      onTap: () {},
      child: Container(
        height: 120,
        width: 220,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffeeeeee),
              blurRadius: 5.0,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Card(
          elevation: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildProfileAvatar(context),
              _buildCaseTitle(context),
                    _buildNIC(context),
                    _buildAge(context),
             
                  ],
                ),
              ),
            
          ),
        );
      
    // );
  }

  Text _buildAge(BuildContext context) {
    return Text(
                    widget.docsnap.data['age'],
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16),
                  );
  }

  Padding _buildNIC(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      widget.docsnap.data['NIC'],
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                  );
  }

  Text _buildCaseTitle(BuildContext context) {
    return Text(
                    widget.docsnap.data['caseTitle'],
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16),
                  );
  }

  Padding _buildProfileAvatar(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.account_circle,size: 80,color: Theme.of(context).primaryColor,),
                ),
              ),
            );
  }
}
