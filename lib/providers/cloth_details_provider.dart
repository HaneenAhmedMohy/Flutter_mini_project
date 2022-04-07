import 'package:flutter/material.dart';
import 'package:tambe_flutter_app/controllers/clothes_controller.dart';
import 'package:tambe_flutter_app/viewModels/clothes_view_model.dart';

import '../viewModels/review_view_model.dart';

class ClothDetailsProvider with ChangeNotifier {
  ClothesController clothesController = ClothesController.getInstance();

  ClothesViewModel clothesViewModel = ClothesViewModel();
  List<ReviewViewModel> reviewViewModels = [];
  static const GET_CLOTH_BY_ID_SYNC_FUNCTION = 'getClothById';
  static const GET_REVIEWS_BY_PRODUCT_ID_ASYNC_FUNCTION =
      'getReviewsbyProductId';

  Future<void> getClothById(int id) async {
    ClothesViewModel result = await clothesController.getClothById(id);
     await getReviewsbyProductId(id);
    //  print('222222222222222${result}');
    clothesViewModel = result;
    // notifyListeners();
  }

  Future<void> getReviewsbyProductId(int id) async {
    List<ReviewViewModel> result =
        await clothesController.getReviewByProductId(id);
    reviewViewModels = [...result];
    // notifyListeners();
  }

  tryCatchAsyncWrapper(String functionName, Function fn) async {
    try {
      print('Start Call: $functionName');
      await fn();
      print('End Call: $functionName');
    } catch (onError, stackTrace) {
      print('errooooooooor');
      return null;
    }
  }
}
