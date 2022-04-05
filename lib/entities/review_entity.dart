class ReviewEntity {
  int id = 0;
  int jeanId = 0;
  String createdAt = '';
  String reviewText = '';
  int stars = 0;

  ReviewEntity(
      {this.id = 0,
      this.jeanId = 0,
      this.createdAt = '',
      this.reviewText = '',
      this.stars = 0});

  ReviewEntity.fromList(Map<String, dynamic> map) {
    id = int.parse(map['id']);
    jeanId = int.parse(map['jeanId']);
    createdAt = map['createdAt'];
    reviewText = map['review_text'];
    stars = map['stars'];
  }

  @override
  String toString() {
    return '''ReviewEntity: id $id, name $jeanId
    ''';
  }
}
