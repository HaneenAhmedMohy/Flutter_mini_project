import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tambe_flutter_app/utils/app_dimensions.dart';
import 'package:tambe_flutter_app/widgets/items_list_widget.dart';
import 'package:tambe_flutter_app/widgets/language_button_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key, this.title = ''}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    AppDimensions(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: AppDimensions.convertToW(15),
            right: AppDimensions.convertToW(15)),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    vertical: AppDimensions.convertToH((20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title.tr(),
                      textAlign: TextAlign.start,
                    ),
                    const LanguageButtonWidget(),
                  ],
                )),
            const ItemsListWidget(),
          ],
        ),
      ),
    );
  }
}
