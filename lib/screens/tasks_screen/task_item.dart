import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myday/models/task_model.dart';
import 'package:myday/shared/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../firebase/firebase_function.dart';
import '../task_update/edit_screen.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.taskModel);

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),

          children: [
            SlidableAction(
              // flex: 2,

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              onPressed: (context) {
                FirebaseFunction.deleteTask(taskModel.id);
              },
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return EditTap(task: taskModel);
                },));
                FirebaseFunction.updateTask(taskModel.id, taskModel);
              },
              icon: Icons.edit,

              foregroundColor: Colors.white,
              backgroundColor: Colors.cyan,
              label: AppLocalizations.of(context)!.edit,
            ),
          ],
        ),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .02,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 8),
                // padding:EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const VerticalDivider(
                  width: 4,
                  thickness: 3,
                  color: primary,
                  endIndent: 2,
                  indent: 2,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: taskModel.status
                        ? Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.green,
                              decoration: TextDecoration.lineThrough,
                            )
                        : Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: primary,
                            ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    taskModel.description,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: taskModel.status
                    ? Text(
                        "DONE !",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: Checkbox.width,
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primary),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the value as needed
                            ),
                          ),
                        ),
                        onPressed: () {
                          taskModel.status = true;
                          FirebaseFunction.updateTask(taskModel.id, taskModel);
                        },
                        child: Icon(
                          Icons.done_outline_sharp,
                          size: Checkbox.width,
                        ),
                      ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
