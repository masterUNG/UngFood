import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungfood/utility/my_constant.dart';

class OrderListShop extends StatefulWidget {
  @override
  _OrderListShopState createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {
  String idShop;

  @override
  void initState() {
    super.initState();
    findIdShopAndReadOrder();
  }

  Future<Null> findIdShopAndReadOrder() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idShop = preferences.getString(MyConstant().keyId);
    print('idShop = $idShop');

    String path =
        '${MyConstant().domain}/UngFood/getOrderWhereIdShop.php?isAdd=true&idShop=$idShop';
    await Dio().get(path).then((value) {
      print('value ==>> $value');
      var result = json.decode(value.data);
      print('result ==>> $result');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('แสดงราการอาหาร ที่ลูกค้าสั่ง 123'),
    );
  }
}
