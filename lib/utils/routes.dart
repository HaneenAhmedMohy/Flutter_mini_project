import 'package:flutter/material.dart';
import 'package:tambe_flutter_app/screens/home_page_screen.dart';
import 'package:tambe_flutter_app/screens/item_details_screen.dart';

class Routes {
  static const String HOME_SCREEN = '/homeScreen';
  static const String ITEM_DETAILS_SCREEN = '/itemDetailsScreen';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      HOME_SCREEN: (context) => HomePageScreen(),
      ITEM_DETAILS_SCREEN: (context) => ItemDetailsScreen(
            props: settings.arguments,
          ),
    };

    WidgetBuilder builder = routes[settings.name]!;
    return MaterialPageRoute(builder: (context) => builder(context));
  }

  static navigateToScreen(String screenName, String navigateType,
      dynamic arguments, BuildContext context) async {
    Widget screenWidget;
    // bool navBar = false;
    switch (navigateType) {
      case NavigateType.PUSH_NAMED:
        switch (screenName) {
          case ITEM_DETAILS_SCREEN:
            screenWidget = ItemDetailsScreen(
              props: arguments,
            );
            break;
          case HOME_SCREEN:
            screenWidget = const HomePageScreen();
            break;
        }
        Navigator.of(context).pushNamed(screenName, arguments: arguments);
        break;

      case NavigateType.POP:
        Navigator.of(context).pop();
        break;
      default:
        break;
    }
  }
}

class NavigateType {
  static const PUSH_NAMED = 'pushNamed';
  static const POP = 'pop';
}
