import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:myday/screens/tasks_screen/task_item.dart';
import '../../shared/styles/app_colors.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    // var widthMQ = MediaQuery.of(context).size.width;
    var heightMQ = MediaQuery.of(context).size.height;
    return Container(
      color: white,
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2000, 1, 1),
            lastDate: DateTime.now().add(const Duration(days: 36500)),
            onDateSelected: (date) => (date),
            leftMargin: 120,
            monthColor: blueGrey,
            dayColor: Colors.blue[300],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: primary,
            dotsColor: white,
            // selectableDayPredicate: (date) => date.day != 23 //true,
            locale: 'en',
          ),
          SizedBox(
            height: heightMQ * .01,
          ),
          const Divider(
            color: primary,
            thickness: 3,
            indent: 40,
            endIndent: 40,
            height: 3,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const TaskItem();
              },
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
