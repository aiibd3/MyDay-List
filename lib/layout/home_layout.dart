import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myday/screens/settings_screen/settings_tab.dart';
import 'package:myday/screens/tasks_screen/tasks_tab.dart';
import 'package:myday/shared/styles/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import '../screens/widgets/show_add_task_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomeLayout';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MProvider>(context);

    return Scaffold(
      backgroundColor: white,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.myDay,
          style:pro.languageCode=="en" ? GoogleFonts.aBeeZee(
            color: white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ): GoogleFonts.mada(
            color: white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTask();
        },
        backgroundColor: primary,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              label: "",
            )
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [const TasksTab(), const SettingTab()];

  void showAddTask() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const ShowAddTaskSheet();
      },
    );
  }
}
