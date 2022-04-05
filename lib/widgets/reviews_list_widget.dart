import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tambe_flutter_app/utils/app_dimensions.dart';
import 'package:tambe_flutter_app/utils/utils_functions.dart';
import 'package:tambe_flutter_app/viewModels/review_view_model.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ReviewsListWidget extends StatelessWidget {
  const ReviewsListWidget({Key? key, required this.reviewViewModels})
      : super(key: key);
  final List<ReviewViewModel> reviewViewModels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: AppDimensions.convertToH(50)),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemCount: reviewViewModels.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.convertToH(8),
                  ),
                  child: Text(
                    UtilFunctions.returnRatingText(
                      double.parse(reviewViewModels[index].stars.toString()),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AppDimensions.convertToH((12))),
                  child: RatingStars(
                    value:
                        double.parse(reviewViewModels[index].stars.toString()),
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                    ),
                    starCount: 5,
                    starSize: 20,
                    starSpacing: 2,
                    starOffColor: const Color(0xffe7e8ea),
                    valueLabelVisibility: false,
                    starColor: Colors.yellow,
                  ),
                ),
                Text(reviewViewModels[index].reviewText, style: const TextStyle(height: 1.5),),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimensions.convertToH(15)),
                  child: Text(DateFormat.yMMMMd('en_US').format(
                      DateTime.parse(reviewViewModels[index].createdAt))),
                ),
                if (index != reviewViewModels.length - 1)
                  const Divider(
                    color: Colors.blueAccent,
                  )
              ],
            );
          }),
    );
  }
}
