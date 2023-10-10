import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/styles/app_colors.dart';

typedef OnClickShow = void Function(BuildContext context);

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.titleSetting,
      required this.iconSetting,
      required this.supTitleSetting,
      required this.onClickShow});

  final OnClickShow onClickShow;
  final String titleSetting;
  final String supTitleSetting;
  final IconData iconSetting;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onClickShow(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconSetting,
                size: 20,
                color: primary,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .02),
              Text(
                titleSetting,
                style: GoogleFonts.inter(color: black, fontSize: 20),
              ),
              const Spacer(),
              Text(
                supTitleSetting,
                style: GoogleFonts.inter(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .02),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
