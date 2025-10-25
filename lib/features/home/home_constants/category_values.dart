import 'package:nha_228/features/home/models/waste_item_model.dart';

class CategoryValues {
  static const int metalPrice = 10;
  static const int plasticPrice = 20;
  static const int oilPrice = 12;
  static const int electronicPrice = 10;
  static const int paperPrice = 10;
  static const int cartonPrice = 10;


  add to firebase
  static List<WasteItem> wasteItems = [
    WasteItem(
      title: "Metal waste",
      imagePath: "assets/images/metal.png",
      price: "$metalPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Plastic waste",
      imagePath: "assets/images/plastic.png",
      price: "$plasticPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Oil waste",
      imagePath: "assets/images/oil.png",
      price: "$oilPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Electronic waste",
      imagePath: "assets/images/electronic.png",
      price: "$electronicPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Paper waste",
      imagePath: "assets/images/paper.png",
      price: "$paperPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Carton waste",
      imagePath: "assets/images/carton.png",
      price: "$cartonPrice pounds per 1 Kg",
    ),
  ];
}
