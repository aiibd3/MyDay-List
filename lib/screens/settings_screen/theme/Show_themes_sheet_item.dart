import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../providers/provider.dart';
import '../../../shared/styles/app_colors.dart';

class ShowThemesSheetItem extends StatelessWidget {
  const ShowThemesSheetItem({super.key, required this.selectedName, required this.selectedN});

  final String selectedName;
  final String selectedN;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MProvider>(context);

    return InkWell(
      onTap: () {
        pro.changeLanguage(selectedN);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              selectedName,
              style: GoogleFonts.inter(color: primary, fontSize: 25),
            ),
            const Spacer(),
            const Icon(
              Icons.done_outline_sharp,
              size: 25,
              color: primary,
            ),
          ],
        ),
      ),
    );
  }
}
