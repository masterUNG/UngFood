import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteHelper {
  final String nameDatabase = 'ungFood.db';
  final String tableDatabase = 'orderTABLE';
  int version = 1;

  final String idColumn = 'id';
  final String idShopColumn = 'idShop';
  final String nameShop = 'nameShop';
  final String idFood = 'idFood';
  final String nameFood = 'nameFood';
  final String price = 'price';
  final String amount = 'amount';
  final String sum = 'sum';
  final String distance = 'transport';
  final String transport = 'transport';

  SQLiteHelper() {
    initDatabase();
  }

  Future<Null> initDatabase() async {
    await openDatabase(join(await getDatabasesPath(), nameDatabase),
        onCreate: (db, version) => db.execute(
            'CREATE TABLE $tableDatabase ($idColumn INTEGER PRIMARY KEY, $idShopColumn TEXT, $nameShop TEXT, $idFood TEXT, $nameFood TEXT, $price TEXT, $amount TEXT, $sum TEXT, $distance TEXT, $transport TEXT)'),
        version: version);
  }
}
