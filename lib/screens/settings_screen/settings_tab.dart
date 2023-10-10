import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myday/providers/provider.dart';
import 'package:myday/screens/settings_screen/setting_item.dart';
import 'package:myday/screens/settings_screen/theme/show_themes_sheet.dart';
import 'package:myday/shared/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'language/show_languages_sheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.setting,
            style: GoogleFonts.inter(
              color: black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          SettingItem(
            titleSetting: AppLocalizations.of(context)!.language,
            iconSetting: Icons.language,
            supTitleSetting: pro.languageCode == "en"
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            onClickShow: showLanguagesSheet,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .01),
          const Divider(
            thickness: 2,
            endIndent: 40,
            indent: 40,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .01),
          SettingItem(
            titleSetting: AppLocalizations.of(context)!.theming,
            iconSetting: Icons.light_mode,
            supTitleSetting: AppLocalizations.of(context)!.lightMode,
            onClickShow: showThemesSheet,
          ),
        ],
      ),
    );
  }

  void showLanguagesSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShowLanguagesSheet();
      },
    );
  }

  void showThemesSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShowThemesSheet();
      },
    );
  }
}
