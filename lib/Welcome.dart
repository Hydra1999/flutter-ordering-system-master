import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/table.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'models/user.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: Text("首页"),
      ),
      body: Consumer<UserStatus>(builder: (context, userStatus, child) {
        return Column(
          children: <Widget>[
            GestureDetector(
              child: IndexCard("OPEN", "开始点餐"),
              onTap: () {
                if (userStatus.value)
                  Navigator.pushNamed(context, TablePage.routeName);
                else
                  Navigator.pushNamed(context, LoginPage.routeName);
              },
            ),
          ],
        );
      }),
    );
  }
}

class IndexCard extends StatelessWidget {
  final String title;
  final String description;

  IndexCard(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Card(
          color: Colors.lightBlue,
          elevation: 10,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 30,color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.border_color,
                      color: Colors.white,),
                    Text(
                      description,
                      style: TextStyle(fontSize:18,color: Colors.white),)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
