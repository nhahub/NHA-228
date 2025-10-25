import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/features/home/models/waste_item_model.dart';

class CategoryValues {
  static const int metalPrice = 10;
  static const int plasticPrice = 20;
  static const int oilPrice = 12;
  static const int electronicPrice = 10;
  static const int paperPrice = 10;
  static const int cartonPrice = 10;



  static data ... wrong
  static final List<WasteItem> wasteItems = [
    WasteItem(
      title: "Metal waste",
      imagePath: AppAssets.metal,
      price: "$metalPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Plastic waste",
      imagePath: AppAssets.plastic,
      price: "$plasticPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Oil waste",
      imagePath: AppAssets.oil,
      price: "$oilPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Electronic waste",
      imagePath: AppAssets.electronic,
      price: "$electronicPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Paper waste",
      imagePath: AppAssets.paper,
      price: "$paperPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Carton waste",
      imagePath: AppAssets.carton,
      price: "$cartonPrice pounds per 1 Kg",
    ),
  ];
}
