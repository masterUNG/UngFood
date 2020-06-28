import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungfood/model/user_model.dart';
import 'package:ungfood/utility/my_constant.dart';

class ShowMenuFood extends StatefulWidget {
  final UserModel userModel;
  ShowMenuFood({Key key, this.userModel}) : super(key: key);
  @override
  _ShowMenuFoodState createState() => _ShowMenuFoodState();
}

class _ShowMenuFoodState extends State<ShowMenuFood> {
  UserModel userModel;
  String idShop;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    readFoodMenu();
  }

  Future<Null> readFoodMenu() async {
    idShop = userModel.id;
    String url =
        '${MyConstant().domain}/UngFood/getFoodWhereIdShop.php?isAdd=true&idShop=$idShop';
    Response response = await Dio().get(url);
    print('res --> $response');
  }

  @override
  Widget build(BuildContext context) {
    return Text('id shop ==>> ${userModel.id}');
  }
}
