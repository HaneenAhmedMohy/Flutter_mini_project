class ClothesEntity {
  int id = 0;
  String name = '';
  String category = '';
  String image = '';
  double price = 0;
  List colors = [];

  ClothesEntity(
      {this.id = 0,
      this.name = '',
      this.category = '',
      this.image = '',
      this.price = 0,
      this.colors = const []});

  ClothesEntity.fromList(Map<String, dynamic> map) {
    id = int.parse(map['id']);
    name = map['name'];
    category = map['category'];
    image = map['image'];
    price = double.parse(map['price']);
    colors = map['colors'];
  }

  @override
  String toString() {
    return '''ClothesEntity: id $id,name $name
    ''';
  }
}
