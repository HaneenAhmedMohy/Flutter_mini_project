import 'package:flutter/material.dart';
import 'package:tambe_flutter_app/controllers/clothes_controller.dart';
import 'package:tambe_flutter_app/viewModels/clothes_view_model.dart';

class ClothesProvider with ChangeNotifier {
  // static const name = 'ClothesProvider';

  // static const String GET_CLOTHES_ASYNC_FUNCTION = 'getClothes';

  // Not for listeners
  ClothesController clothesController = ClothesController.getInstance();

  List<ClothesViewModel> clothesViewModels = [];

  Future<void> getClothes() async {
    List<ClothesViewModel> result = await clothesController.getClothes();
    clothesViewModels = [...result];
    // notifyListeners();
  }

  
}
