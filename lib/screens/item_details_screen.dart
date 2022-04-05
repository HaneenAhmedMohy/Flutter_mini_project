import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tambe_flutter_app/providers/cloth_details_provider.dart';
import 'package:tambe_flutter_app/widgets/reviews_list_widget.dart';

import '../utils/app_dimensions.dart';
import '../utils/routes.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({Key? key, this.props = 0}) : super(key: key);
  final dynamic props;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Routes.navigateToScreen(
              Routes.HOME_SCREEN, NavigateType.POP, {}, context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: context.read<ClothDetailsProvider>().getClothById(props),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Selector<ClothDetailsProvider, Map<String, dynamic>>(
                    selector: (_, provider) => {
                          'clothesVm': provider.clothesViewModel,
                          'reviewVm': provider.reviewViewModels,
                          'reviewLength': provider.reviewViewModels.length
                        },
                    builder: (_, data, __) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.convertToW((20))),
                        child: Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      height: AppDimensions.convertToH(450),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              data['clothesVm'].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: null),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.convertToH(30)),
                                  child: Text(
                                    data['clothesVm'].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.convertToH(15)),
                                  child: Text(
                                    data['clothesVm'].category,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.convertToH(20),
                                      bottom: AppDimensions.convertToH(20)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data['clothesVm'].price.toString() +
                                              ' EGP',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Row(
                                          children: data['clothesVm']
                                              .colors
                                              .map<Widget>((e) => Card(
                                                  color: Colors.blueGrey[300],
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    color: Color(int.parse(e)),
                                                  )))
                                              .toList(),
                                        ),
                                      ]),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.convertToH(20)),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Reviews [' +
                                            data['reviewLength'].toString() +
                                            ']',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                ReviewsListWidget(
                                    reviewViewModels: data['reviewVm'])
                              ]),
                        ),
                      );
                    }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
            }
          }),
    );
  }
}
