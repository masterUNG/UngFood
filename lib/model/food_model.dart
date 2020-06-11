class FoodModel {
  String id;
  String idShop;
  String nameFood;
  String pathImage;
  String price;
  String detail;

  FoodModel(
      {this.id,
      this.idShop,
      this.nameFood,
      this.pathImage,
      this.price,
      this.detail});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idShop = json['idShop'];
    nameFood = json['NameFood'];
    pathImage = json['PathImage'];
    price = json['Price'];
    detail = json['Detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idShop'] = this.idShop;
    data['NameFood'] = this.nameFood;
    data['PathImage'] = this.pathImage;
    data['Price'] = this.price;
    data['Detail'] = this.detail;
    return data;
  }
}

