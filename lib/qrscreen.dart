import 'package:flutter/material.dart';
import 'models/cartmodel.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatelessWidget {
  static const routeName = '/qrcode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: Text("首页"),
      ),
      body:Column(
        children: <Widget>[
          TotalPrice(),
        ],
      )
    );
  }
}

class TotalPrice extends StatelessWidget {
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