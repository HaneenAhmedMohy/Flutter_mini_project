import 'package:tambe_flutter_app/entities/clothes_entity.dart';

class ClothesViewModel {
  int id = 0;
  String name = '';
  String category = '';
  String image = '';
  double price = 0;
  List colors = [];

  ClothesViewModel(
      {this.id = 0,
      this.name = '',
      this.category = '',
      this.image = '',
      this.price = 0,
      this.colors = const []});

  ClothesViewModel.fromEntity(ClothesEntity obj) {
    id = obj.id;
    name = obj.name;
    category = obj.category;
    image = obj.image;
    price = obj.price;
    colors = obj.colors;
  }

  @override
  String toString() {
    return '''ClothesViewModel: id $id, name $name
    ''';
  }
}
