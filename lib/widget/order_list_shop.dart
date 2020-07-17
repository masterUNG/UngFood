import 'package:flutter/material.dart';
import 'package:ungfood/model/user_model.dart';

class OrderListShop extends StatefulWidget {
  @override
  _OrderListShopState createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {

  UserModel userModel;

  @override
  void initState() { 
    super.initState();
    
  }

  

  @override
  Widget build(BuildContext context) {
    return Text(
      'แสดงราการอาหาร ที่ลูกค้าสั่ง'
    );
  }
}