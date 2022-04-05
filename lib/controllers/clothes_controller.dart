import 'package:tambe_flutter_app/apis/clothes_api.dart';
import 'package:tambe_flutter_app/entities/clothes_entity.dart';
import 'package:tambe_flutter_app/entities/review_entity.dart';
import 'package:tambe_flutter_app/viewModels/clothes_view_model.dart';
import 'package:tambe_flutter_app/viewModels/review_view_model.dart';

class ClothesController {
  static ClothesController _instance = ClothesController();
  static const name = 'ClothesController';

  ClothesApi clothesApi = ClothesApi.getInstance();

  static ClothesController getInstance() {
    return _instance = ClothesController();
  }

  Future<List<ClothesViewModel>> getClothes() async {
    List<ClothesEntity> clothesEntities = await clothesApi.fetchClothes();
    List<ClothesViewModel> clothesViewModel =
        clothesEntities.map<ClothesViewModel>((item) {
      return ClothesViewModel.fromEntity(item);
    }).toList();
    return clothesViewModel;
  }

  Future<ClothesViewModel> getClothById(int id) async {
    ClothesEntity clothesEntity = await clothesApi.getClothesById(id);
    ClothesViewModel clothesViewModel =
        ClothesViewModel.fromEntity(clothesEntity);
    return clothesViewModel;
  }

  Future<List<ReviewViewModel>> getReviewByProductId(int id) async {
    List<ReviewEntity> reviewEntities = await clothesApi.getProductReviews(id);
    List<ReviewViewModel> reviewViewModel =
        reviewEntities.map<ReviewViewModel>((item) {
      return ReviewViewModel.fromEntity(item);
    }).toList();
    return reviewViewModel;
  }
}
