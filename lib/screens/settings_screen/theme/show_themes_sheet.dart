import 'package:flutter/material.dart';
import 'package:myday/screens/settings_screen/theme/Show_themes_sheet_item.dart';
import '../../../shared/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowThemesSheet extends StatelessWidget {
  const ShowThemesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShowThemesSheetItem(
              selectedName: AppLocalizations.of(context)!.lightMode,
          selectedN: ""),
          const Divider(
            thickness: 1,
            indent: 50,
            endIndent: 50,
            color: primary,
          ),
          ShowThemesSheetItem(
              selectedName: AppLocalizations.of(context)!.darkMode,
          selectedN:"" ),
        ],
      ),
    );
  }
}
