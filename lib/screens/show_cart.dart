import 'package:flutter/material.dart';
import 'package:ungfood/model/cart_model.dart';
import 'package:ungfood/utility/my_style.dart';
import 'package:ungfood/utility/sqlite_helper.dart';

class ShowCart extends StatefulWidget {
  @override
  _ShowCartState createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  List<CartModel> cartModels = List();
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readSQLite();
  }

  Future<Null> readSQLite() async {
    var object = await SQLiteHelper().readAllDataFromSQLite();

    for (var model in object) {
      String sumString = model.sum;
      int sumInt = int.parse(sumString);
      setState(() {
        cartModels = object;
        total = total + sumInt;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตะกร้าของฉัน'),
      ),
      body: cartModels.length == 0 ? MyStyle().showProgress() : buildContent(),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          buildNameShop(),
          buildHeadTitle(),
          buildListFood(),
          Divider(),
          buildTotal(),
        ],
      ),
    );
  }

  Widget buildTotal() => Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MyStyle().showTitleH2('Total : '),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitleH3Red(total.toString()),
          )
        ],
      );

  Widget buildNameShop() {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              MyStyle().showTitleH2('ร้าน ${cartModels[0].nameShop}'),
            ],
          ),
          Row(
            children: <Widget>[
              MyStyle()
                  .showTitleH3('ระยะทาง = ${cartModels[0].distance} กิโลเมตร'),
            ],
          ),
          Row(
            children: <Widget>[
              MyStyle()
                  .showTitleH3('ค่าขนส่ง = ${cartModels[0].transport} บาท'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHeadTitle() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: MyStyle().showTitleH3('ราการอาหาร'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitleH3('ราคา'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitleH3('จำนวน'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitleH3('ผลรวม'),
          ),
        ],
      ),
    );
  }

  Widget buildListFood() => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: cartModels.length,
        itemBuilder: (context, index) => Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Text(cartModels[index].nameFood),
            ),
            Expanded(
              flex: 1,
              child: Text(cartModels[index].price),
            ),
            Expanded(
              flex: 1,
              child: Text(cartModels[index].amount),
            ),
            Expanded(
              flex: 1,
              child: Text(cartModels[index].sum),
            ),
          ],
        ),
      );
}
