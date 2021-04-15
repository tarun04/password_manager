import 'package:flutter/material.dart';

import 'account_widget.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: Icon(Icons.lock, color: Colors.grey.shade800,),
            ),
            Expanded(
              flex: 6,
              child: Text('Search here', style: TextStyle(fontSize: 16.0),),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.grey[800],
              onPressed: _showAccountDialog,
            ),
          ],
        ),
      ),
    );
  }

  _showAccountDialog() {
    showDialog(
      context: context,
      builder: (_) => new Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(15.0),
        child: AccountWidget(),
      )
    );
  }
}
