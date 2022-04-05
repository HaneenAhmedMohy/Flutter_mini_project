import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';
import '../utils/routes.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget(
      {Key? key,
      this.id = 0,
      this.image = '',
      this.name = '',
      this.category = '',
      this.price = 0})
      : super(key: key);
  final String image;
  final String name;
  final String category;
  final double price;
  final int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Routes.navigateToScreen(Routes.ITEM_DETAILS_SCREEN,
          NavigateType.PUSH_NAMED, id, context),
      child: Padding(
        padding: EdgeInsets.only(
            top: AppDimensions.convertToH(10),
            right: AppDimensions.convertToH(10),
            left: AppDimensions.convertToH(10)),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      height: AppDimensions.convertToH(150),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: null),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.convertToW(10),
                  vertical: AppDimensions.convertToH(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: AppDimensions.convertToH((5))),
                      child: Text(name),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: AppDimensions.convertToH((5))),
                      child: Text(
                        category,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: AppDimensions.convertToH((15))),
                      child: Text(
                        price.toString(),
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
