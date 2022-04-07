import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/locale_keys.g.dart';
import '../providers/clothes_provider.dart';

class LanguageButtonWidget extends StatelessWidget {
  const LanguageButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          LocaleKeys.new_screen_title,
          textAlign: TextAlign.start,
        ).tr(),
        ElevatedButton(
          onPressed: () async {
            if (context.locale == const Locale('en')) {
              context.setLocale(context.supportedLocales[1]);
            } else {
              context.setLocale(context.supportedLocales[0]);
            }
            await Provider.of<ClothesProvider>(context, listen: false)
                .getClothes();
          },
          child: const Text(LocaleKeys.change_language).tr(),
        )
      ],
    );
  }
}
