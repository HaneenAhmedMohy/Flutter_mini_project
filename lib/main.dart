import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tambe_flutter_app/providers/cloth_details_provider.dart';
import 'package:tambe_flutter_app/providers/clothes_provider.dart';
import 'package:tambe_flutter_app/screens/home_page_screen.dart';
import 'package:tambe_flutter_app/utils/routes.dart';
import 'generated/codegen_loader.g.dart';
import 'generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'resources/langs',
        assetLoader: CodegenLoader(),
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  final ClothesProvider _clothesProvider = ClothesProvider();

  MyApp() {
    _clothesProvider.getClothes();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ClothesProvider()),
        ChangeNotifierProvider.value(value: ClothDetailsProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<ClothesProvider>(
            create: (_) => _clothesProvider, child: const HomePageScreen(title:LocaleKeys.screen_title)),
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
