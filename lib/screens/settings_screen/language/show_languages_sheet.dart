import 'package:flutter/material.dart';
import 'package:myday/screens/settings_screen/language/show_languages_sheet_item.dart';
import '../../../shared/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowLanguagesSheet extends StatelessWidget {
  const ShowLanguagesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShowLanguagesSheetItem(
              selectedName: AppLocalizations.of(context)!.english,
              selectedName_: "en"),
          const Divider(
            thickness: 1,
            indent: 50,
            endIndent: 50,
            color: primary,
          ),
          ShowLanguagesSheetItem(
              selectedName: AppLocalizations.of(context)!.arabic,
              selectedName_: "ar"),
        ],
      ),
    );
  }
}
