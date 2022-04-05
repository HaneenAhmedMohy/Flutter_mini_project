import 'package:flutter/material.dart';
import 'package:tambe_flutter_app/controllers/clothes_controller.dart';
import 'package:tambe_flutter_app/viewModels/clothes_view_model.dart';

import '../viewModels/review_view_model.dart';

class ClothDetailsProvider with ChangeNotifier {
  ClothesController clothesController = ClothesController.getInstance();

  ClothesViewModel clothesViewModel = ClothesViewModel();
  List<ReviewViewModel> reviewViewModels = [];

  Future<void> getClothById(int id) async {
    ClothesViewModel result = await clothesController.getClothById(id);
    await getReviewsbyProductId(id);
    clothesViewModel = result;
    // notifyListeners();
  }

  Future<void> getReviewsbyProductId(int id) async {
    List<ReviewViewModel> result =
        await clothesController.getReviewByProductId(id);
    reviewViewModels = [...result];
    // notifyListeners();
  }
}
