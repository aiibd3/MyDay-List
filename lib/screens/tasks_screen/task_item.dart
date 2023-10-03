import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myday/shared/styles/app_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.delete,
            label: "Delete",
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.edit,
            foregroundColor: Colors.white,
            backgroundColor: Colors.cyan,
            label: "Edit",
          ),
        ],
      ),
      child: SizedBox(
        height: 92,
        child: Card(
          elevation: 5,
          color: Colors.blueGrey[10],
          shadowColor: black,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .02,
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(12),
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
                    "Task Title",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: primary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Task Description",
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
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the value as needed
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(
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
