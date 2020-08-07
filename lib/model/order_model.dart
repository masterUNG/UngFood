class OrderModel {
  String id;
  String orderDateTime;
  String idUser;
  String nameUser;
  String idShop;
  String nameShop;
  String distance;
  String transport;
  String idFood;
  String nameFood;
  String price;
  String amount;
  String sum;
  String idRider;
  String status;

  OrderModel(
      {this.id,
      this.orderDateTime,
      this.idUser,
      this.nameUser,
      this.idShop,
      this.nameShop,
      this.distance,
      this.transport,
      this.idFood,
      this.nameFood,
      this.price,
      this.amount,
      this.sum,
      this.idRider,
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDateTime = json['OrderDateTime'];
    idUser = json['idUser'];
    nameUser = json['NameUser'];
    idShop = json['idShop'];
    nameShop = json['NameShop'];
    distance = json['Distance'];
    transport = json['Transport'];
    idFood = json['idFood'];
    nameFood = json['NameFood'];
    price = json['Price'];
    amount = json['Amount'];
    sum = json['Sum'];
    idRider = json['idRider'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['OrderDateTime'] = this.orderDateTime;
    data['idUser'] = this.idUser;
    data['NameUser'] = this.nameUser;
    data['idShop'] = this.idShop;
    data['NameShop'] = this.nameShop;
    data['Distance'] = this.distance;
    data['Transport'] = this.transport;
    data['idFood'] = this.idFood;
    data['NameFood'] = this.nameFood;
    data['Price'] = this.price;
    data['Amount'] = this.amount;
    data['Sum'] = this.sum;
    data['idRider'] = this.idRider;
    data['Status'] = this.status;
    return data;
  }
}

