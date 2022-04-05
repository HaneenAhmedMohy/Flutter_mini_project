import 'package:tambe_flutter_app/entities/review_entity.dart';

class ReviewViewModel {
  int id = 0;
  int jeanId = 0;
  String createdAt = '';
  String reviewText = '';
  int stars = 0;

  ReviewViewModel(
      {this.id = 0,
      this.jeanId = 0,
      this.createdAt = '',
      this.reviewText = '',
      this.stars = 0});

  ReviewViewModel.fromEntity(ReviewEntity obj) {
    if (obj.id != null) {
      id = obj.id;
      jeanId = obj.jeanId;
      createdAt = obj.createdAt;
      reviewText = obj.reviewText;
      stars = obj.stars;
    }
  }

  @override
  String toString() {
    return '''ReviewViewModel: id $id, name $jeanId
    ''';
  }
}
