import 'dart:ui';

import 'package:flutter/material.dart';

/// ----------
class Product {
  double price;
  String name;
  String introduce;
  String id;

  Product(this.price, this.name ,this.introduce,this.id);
}

class CatalogModel with ChangeNotifier {
  List<Product> _products = [];

  // 也可以声明为listProducts()方法，但是调用时不同
  List<Product> listProducts() {
    return _products;
  }

  // 方法名称可以像业务方法一样命名
  loadProducts() async {
    _products = await Future.delayed(Duration(seconds: 2), () {
      return [
        Product(199, '凤舞祥云综合咖啡豆','食品搭配建议:奶油芝士类食品，太妃、枫糖和坚果类食品','1'),
        Product(169, '派克市场烘焙咖啡豆','食品搭配建议:巧克力，肉桂，果仁','2'),
        Product(129, '肯亚咖啡豆','食品搭配建议:葡萄柚，浆果，无核葡萄干，葡萄干，橙子','3'),
        Product(229, '首选咖啡豆','食品搭配建议:果仁，苹果，蓝莓','4'),
        Product(149, '危地马拉安提瓜咖啡豆','食品搭配建议:可可，苹果，焦糖，果仁','5'),
        Product(209, '埃塞俄比亚咖啡豆','食品搭配建议:黑巧克力、柑橘','6'),
      ];
    });
    notifyListeners();
  }
}
