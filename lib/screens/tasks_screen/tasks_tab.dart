import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myday/firebase/firebase_function.dart';
import 'package:myday/screens/tasks_screen/task_item.dart';
import 'package:provider/provider.dart';
import '../../models/task_model.dart';
import '../../providers/provider.dart';
import '../../shared/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // var widthMQ = MediaQuery.of(context).size.width;
    var heightMQ = MediaQuery.of(context).size.height;
    var provider = Provider.of<MProvider>(context);

    return Container(
      color: white,
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime(2000, 1, 1),
            lastDate: DateTime.now().add(const Duration(days: 36500)),
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            leftMargin: 120,
            monthColor: blueGrey,
            dayColor: Colors.blue[300],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: primary,
            dotsColor: white,
            // selectableDayPredicate: (date) => date.day != 23 //true,
            locale: provider.languageCode,
          ),
          SizedBox(
            height: heightMQ * .01,
          ),
          const Divider(
            color: primary,
            thickness: 3,
            indent: 20,
            endIndent: 20,
            height: 3,
          ),
          StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseFunction.getTasksFromFirestore(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(AppLocalizations.of(context)!.somethingWentWrong),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.tryAgain),
                    )
                  ],
                );
              }
              var tasksList =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              if (tasksList.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Image.asset(
                      "assets/image/Empty-amico.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    SizedBox(
                      height: heightMQ * .01,
                    ),
                    Text(
                      AppLocalizations.of(context)!.youDoNotHavaAnyTasks,
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ],
                );
              }
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TaskItem(tasksList[index]);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: tasksList.length),
              );
            },
          ),
        ],
      ),
    );
  }
}
