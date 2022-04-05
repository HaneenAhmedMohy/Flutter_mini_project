import 'dart:convert';

import 'package:tambe_flutter_app/entities/clothes_entity.dart';
import 'package:http/http.dart' as http;
import 'package:tambe_flutter_app/entities/review_entity.dart';

class ClothesApi {
  static ClothesApi _instance = ClothesApi();

  static ClothesApi getInstance() {
    return _instance = ClothesApi();
  }

  Future<List<ClothesEntity>> fetchClothes() async {
    var url = '624ace4f852fe6ebf88b6faf.mockapi.io';
    try {
      var response = await http.get(Uri.https(url, '/jeans'));
      if (response.statusCode == 200) {
        var list = json.decode(response.body);
        List<ClothesEntity> resultList = list.map<ClothesEntity>((item) {
          return ClothesEntity.fromList(item);
        }).toList();

        return resultList;
      }
      return [];
    } catch (err) {
      return [];
    }
  }

  Future<ClothesEntity> getClothesById(int id) async {
    var url = '624ace4f852fe6ebf88b6faf.mockapi.io';
    try {
      var response = await http.get(Uri.https(url, '/jeans/$id'));
      if (response.statusCode == 200) {
        var item = json.decode(response.body); // id and name
        ClothesEntity result = ClothesEntity.fromList(item);
        return result;
      }
      return ClothesEntity();
    } catch (err) {
      return ClothesEntity();
    }
  }

  Future<List<ReviewEntity>> getProductReviews(int id) async {
    var url = '624ace4f852fe6ebf88b6faf.mockapi.io';
    try {
      var response = await http.get(Uri.https(url, '/jeans/$id/reviews'));
      if (response.statusCode == 200) {
        var list = json.decode(response.body); // id and name
        List<ReviewEntity> resultList = list.map<ReviewEntity>((item) {
          return ReviewEntity.fromList(item);
        }).toList();
        return resultList;
      }
      return [];
    } catch (err) {
      return [];
    }
  }
}
