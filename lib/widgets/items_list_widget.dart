import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tambe_flutter_app/utils/app_dimensions.dart';
import 'package:tambe_flutter_app/widgets/items_grid_view.dart';
import '../providers/clothes_provider.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ClothesProvider>(context, listen: false).getClothes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: AppDimensions.convertToH(20)),
            child: const ItemsGridView(),
          ));
        } else {
          return const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent));
        }
      },
    );
  }
}
