import 'package:flutter/material.dart';
import '../models/cartmodel.dart';
import '../models/catalogmodel.dart';
import '../screens/cart.dart';
import '../screens/catalog.dart';
import 'package:provider/provider.dart';

///Order START
class OrderPage extends StatefulWidget {
  static const routeName = '/order';
  final int index;
  //构造函数 同时传入桌号
  OrderPage({Key key, @required this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print("[桌点餐详情]" + index.toString());
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CatalogModel(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Catalog(),
          "/cart": (context) => Cart(),
        },
      ),
    );
  }
}

/// order END
