import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungfood/screens/add_info_shop.dart';
import 'package:ungfood/utility/my_constant.dart';
import 'package:ungfood/utility/my_style.dart';

class InfomationShop extends StatefulWidget {
  @override
  _InfomationShopState createState() => _InfomationShopState();
}

class _InfomationShopState extends State<InfomationShop> {

  @override
  void initState() { 
    super.initState();
    readDataUser();
  }


  Future<Null> readDataUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id');

    String url = '${MyConstant().domain}/UngFood/getUserWhereId.php?isAdd=true&id=$id';
    await Dio().get(url).then((value) {
      print('value = $value');
    });

  }

  void routeToAddInfo() {
    print('routeToAddInfo Work');
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MyStyle()
            .titleCenter(context, 'ยังไม่มี ข้อมูล กรุณาเพิ่มข้อมูลด้วย คะ'),
        addAnEditButton(),
      ],
    );
  }

  Row addAnEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: 16.0,
                bottom: 16.0,
              ),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () {
                  print('you click floating');
                  routeToAddInfo();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
