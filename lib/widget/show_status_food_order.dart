import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_indicator/steps_indicator.dart';
import 'package:ungfood/model/order_model.dart';
import 'package:ungfood/utility/my_constant.dart';
import 'package:ungfood/utility/my_style.dart';

class ShowStatusFoodOrder extends StatefulWidget {
  @override
  _ShowStatusFoodOrderState createState() => _ShowStatusFoodOrderState();
}

class _ShowStatusFoodOrderState extends State<ShowStatusFoodOrder> {
  String idUser;
  bool statusOrder = true;
  List<OrderModel> orderModels = List();
  List<List<String>> listMenuFoods = List();
  List<List<String>> listPrices = List();
  List<List<String>> listAmounts = List();
  List<List<String>> listSums = List();
  List<int> totalInts = List();
  List<int> statusInts = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
  }

  @override
  Widget build(BuildContext context) {
    return statusOrder ? buildNonOrder() : buildContent();
  }

  Widget buildContent() => ListView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: orderModels.length,
        itemBuilder: (context, index) => Column(
          children: [
            MyStyle().mySizebox(),
            buildNameShop(index),
            buildDatatimeOrder(index),
            buildDistance(index),
            buildTransport(index),
            buildHead(),
            buildListViewMenuFood(index),
            buildTotal(index),
            MyStyle().mySizebox(),
            buildStepIndicator(statusInts[index]),
            MyStyle().mySizebox(),
          ],
        ),
      );

  Widget buildStepIndicator(int index) => Column(
        children: [
          StepsIndicator(
            lineLength: 80,
            selectedStep: index,
            nbSteps: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Order'),
              Text('Cooking'),
              Text('Delivery'),
              Text('Finish'),
            ],
          ),
        ],
      );

  Widget buildTotal(int index) => Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyStyle().showTitleH3Red('รวมราคาอาหาร '),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStyle().showTitleH3Purple(totalInts[index].toString()),
              ],
            ),
          ),
        ],
      );

  ListView buildListViewMenuFood(int index) => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listMenuFoods[index].length,
        itemBuilder: (context, index2) => Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(listMenuFoods[index][index2]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listPrices[index][index2]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listAmounts[index][index2]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listSums[index][index2]),
                ],
              ),
            ),
          ],
        ),
      );

  Container buildHead() {
    return Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(color: Colors.grey),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: MyStyle().showTitleH3White('รายการอาหาร'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitleH3White('ราคา'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitleH3White('จำนวน'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitleH3White('ผลรวม'),
          ),
        ],
      ),
    );
  }

  Row buildTransport(int index) {
    return Row(
      children: [
        MyStyle()
            .showTitleH3Purple('ค่าขนส่ง ${orderModels[index].transport} บาท'),
      ],
    );
  }

  Row buildDistance(int index) {
    return Row(
      children: [
        MyStyle()
            .showTitleH3Red('ระยะทาง ${orderModels[index].distance} กิโลเมตร'),
      ],
    );
  }

  Row buildDatatimeOrder(int index) {
    return Row(
      children: [
        MyStyle().showTitleH3(
            'วันเวลาที่ Order ${orderModels[index].orderDateTime}'),
      ],
    );
  }

  Row buildNameShop(int index) {
    return Row(
      children: [
        MyStyle().showTitleH2('ร้าน ${orderModels[index].nameShop}'),
      ],
    );
  }

  Center buildNonOrder() =>
      Center(child: Text('ยังไม่เคยมี ข้อมูลการสั่งอาหาร'));

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idUser = preferences.getString('id');
    // print('idUser = $idUser');
    readOrderFromIdUser();
  }

  Future<Null> readOrderFromIdUser() async {
    if (idUser != null) {
      String url =
          '${MyConstant().domain}/UngFood/getOrderWhereIdUser.php?isAdd=true&idUser=$idUser';

      Response response = await Dio().get(url);
      // print('respose ######==> $response');
      if (response.toString() != 'null') {
        var result = json.decode(response.data);
        for (var map in result) {
          OrderModel model = OrderModel.fromJson(map);
          List<String> menuFoods = changeArrey(model.nameFood);
          List<String> prices = changeArrey(model.price);
          List<String> amounts = changeArrey(model.amount);
          List<String> sums = changeArrey(model.sum);
          // print('menuFoods ==>> $menuFoods');

          int status = 0;
          switch (model.status) {
            case 'UserOrder':
              status = 0;
              break;
            case 'ShopCooking':
              status = 1;
              break;
            case 'RiderHandle':
              status = 2;
              break;
            case 'Finish':
              status = 3;
              break;
            default:
          }

          int total = 0;
          for (var string in sums) {
            total = total + int.parse(string.trim());
          }

          print('total = $total');

          setState(() {
            statusOrder = false;
            orderModels.add(model);

            listMenuFoods.add(menuFoods);
            listPrices.add(prices);
            listAmounts.add(amounts);
            listSums.add(sums);

            totalInts.add(total);
            statusInts.add(status);
          });
        }
      }
    }
  }

  List<String> changeArrey(String string) {
    List<String> list = List();
    String myString = string.substring(1, string.length - 1);
    // print('myString = $myString');
    list = myString.split(',');
    int index = 0;
    for (var string in list) {
      list[index] = string.trim();
      index++;
    }
    // print('list *****=>> $list');
    return list;
  }
}
