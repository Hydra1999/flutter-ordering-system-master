import 'package:flutter/material.dart';
import '../models/cartmodel.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fooddeliveryapp/qrscreen.dart';


import '../table.dart';
import '../models/table.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('结算界面'),
        backgroundColor: Colors.black87,
      ),
      body:Container(
        child:Column(
          children: <Widget>[
            ItemList(),
            TotalPrice(),
          RaisedButton(
            textTheme: ButtonTextTheme.accent,
            color: Colors.grey,
            highlightColor: Colors.deepPurpleAccent,
            splashColor: Colors.deepOrangeAccent,
            colorBrightness: Brightness.dark,
            elevation: 50.0,
            highlightElevation: 100.0,
            disabledElevation: 20.0,
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("确认结账"),
                      content: Text("您确定结账吗？"),
                      actions: <Widget>[
                        RaisedButton(
                          color: Colors.blueGrey,
                          child: Text("确认",style: TextStyle(color: Colors.white),),
                          onPressed: (){
                            //bool TableStatus.isopen(i) = false;
                            //Navigator.popAndPushNamed(context, QRPage.routeName);
                            Navigator.popAndPushNamed(context, TablePage.routeName);
                          },
                        ),
                        RaisedButton(
                          color: Colors.blueGrey,
                          child: Text("取消",style: TextStyle(color: Colors.white),),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }
              );
            },
            child: Text(
              '结账',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ],
          ),
        ),
      );
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (c, cart, child) {
        return ListView.separated(
          itemBuilder: (c, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '${cart.items[index].product.name}',
                  style: TextStyle(fontSize: 30),
                ),
                Text('数量：${cart.items[index].count}')
              ],
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: cart.items.length,
          shrinkWrap: true,
        );
      },
    );
  }
}


class TotalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (context, cart, widget) {
        return Text('总额：￥${cart.getTotalPrices()}',
            style: TextStyle(color: Colors.blueGrey, fontSize: 36));
      },
    );
  }
}


class QRPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (context, cart, widget) {
        return QrImage(
          data:"总额：￥${cart.getTotalPrices()}",
          size: 300,
        );
      },
    );
  }
}