import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tambe_flutter_app/utils/app_dimensions.dart';
import '../providers/clothes_provider.dart';
import 'item_card_widget.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final double itemHeight = (screenSize.height - kToolbarHeight - 24);
    final double itemWidth = screenSize.width;

    if (AppDimensions.isSmallScreen()) {
      return Selector<ClothesProvider, Map<String, dynamic>>(
        selector: (_, provider) => {
          'clothesVm': provider.clothesViewModels,
          'length': provider.clothesViewModels.length
        },
        builder: (_, data, __) {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: ((itemWidth / 2) / (itemHeight / 2)),
            // mainAxisSpacing: AppDimensions.convertToH((20)),
            // crossAxisSpacing: AppDimensions.convertToW(20),
            children: List.generate(data['length'], (index) {
              return ItemCardWidget(
                  image: data['clothesVm'][index].image,
                  name: data['clothesVm'][index].name,
                  category: data['clothesVm'][index].category,
                  price: data['clothesVm'][index].price,
                  id: data['clothesVm'][index].id);
            }),
          );
        },
      );
    } else if (AppDimensions.isMediumScreen()) {
      return Selector<ClothesProvider, Map<String, dynamic>>(
        selector: (_, provider) => {
          'clothesVm': provider.clothesViewModels,
          'length': provider.clothesViewModels.length
        },
        builder: (_, data, __) {
          return GridView.count(
            crossAxisCount: 3,
            childAspectRatio: ((itemWidth / 4) / (itemHeight / 2.5)),
            // mainAxisSpacing: AppDimensions.convertToH((20)),
            // crossAxisSpacing: AppDimensions.convertToW(20),
            children: List.generate(data['length'], (index) {
              return ItemCardWidget(
                  image: data['clothesVm'][index].image,
                  name: data['clothesVm'][index].name,
                  category: data['clothesVm'][index].category,
                  price: data['clothesVm'][index].price,
                  id: data['clothesVm'][index].id);
            }),
          );
        },
      );
    } else if (AppDimensions.isLargeScreen()) {
      return Selector<ClothesProvider, Map<String, dynamic>>(
        selector: (_, provider) => {
          'clothesVm': provider.clothesViewModels,
          'length': provider.clothesViewModels.length
        },
        builder: (_, data, __) {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio: ((itemWidth / 3.6) / (itemHeight / 2)),
            // mainAxisSpacing: AppDimensions.convertToH((20)),
            // crossAxisSpacing: AppDimensions.convertToW(20),
            children: List.generate(data['length'], (index) {
              return ItemCardWidget(
                  image: data['clothesVm'][index].image,
                  name: data['clothesVm'][index].name,
                  category: data['clothesVm'][index].category,
                  price: data['clothesVm'][index].price,
                  id: data['clothesVm'][index].id);
            }),
          );
        },
      );
    }
    return Selector<ClothesProvider, Map<String, dynamic>>(
      selector: (_, provider) => {
        'clothesVm': provider.clothesViewModels,
        'length': provider.clothesViewModels.length
      },
      builder: (_, data, __) {
        return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: ((itemWidth / 2) / (itemHeight / 2)),
          // mainAxisSpacing: AppDimensions.convertToH((20)),
          // crossAxisSpacing: AppDimensions.convertToW(20),
          children: List.generate(data['length'], (index) {
            return ItemCardWidget(
                image: data['clothesVm'][index].image,
                name: data['clothesVm'][index].name,
                category: data['clothesVm'][index].category,
                price: data['clothesVm'][index].price,
                id: data['clothesVm'][index].id);
          }),
        );
      },
    );
  }
}
