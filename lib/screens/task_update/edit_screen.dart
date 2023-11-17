import '../../shared/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myday/models/task_model.dart';
import 'package:provider/provider.dart';
import '../../firebase/firebase_function.dart';
import '../../providers/provider.dart';

class EditTap extends StatefulWidget {
  static String routeName = "EditTap";
  TaskModel task;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  late DateTime dateController;

  EditTap({required this.task}) {
    titleController.text = task.title;
    descriptionController.text = task.description;
    dateController = DateTime.fromMicrosecondsSinceEpoch(task.date);
  }

  @override
  State<EditTap> createState() => _EditTapState();
}

class _EditTapState extends State<EditTap> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MProvider>(context);

    return Scaffold(
      backgroundColor: white,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.taskEdit,
          style: pro.languageCode == "en"
              ? GoogleFonts.aBeeZee(
                  color: white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )
              : GoogleFonts.mada(
                  color: white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            TextFormField(
              controller: widget.titleController,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleasEnterTaskTitle;
                }
                return null;
              },
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                ),
                label: Text(
                  AppLocalizations.of(context)!.taskTitle,
                  style: const TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.w400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            TextFormField(
              controller: widget.descriptionController,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                      .pleasEnterTaskDescription;
                }
                return null;
              },
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                ),
                label: Text(
                  AppLocalizations.of(context)!.taskDescription,
                  style: const TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.w400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                minimumSize: const Size(100, 40),
                textStyle: TextStyle(fontStyle: FontStyle.normal),
              ),
              onPressed: () async {
                DateTime? chosenDate = await showDatePicker(
                  context: context,
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        textTheme: TextTheme(
                          bodyMedium: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                        colorScheme: const ColorScheme.light(
                          primary: primary, // header background color
                          onPrimary: white, // header text color
                          onSurface: black, // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: black, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                  initialDate: widget.dateController,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                );
                if (chosenDate != null) {
                  widget.dateController = DateUtils.dateOnly(chosenDate);
                  setState(() {});
                }
              },
              child: Text(
                AppLocalizations.of(context)!.selectTime,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Text(
              widget.dateController.toString().substring(0, 10),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                minimumSize: const Size(100, 40),
                textStyle: TextStyle(fontStyle: FontStyle.normal),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                widget.task.title = widget.titleController.text;
                widget.task.description = widget.descriptionController.text;
                widget.task.date = widget.dateController.microsecondsSinceEpoch;
                FirebaseFunction.updateTask(widget.task.id, widget.task);

                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.saveChanges,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
          ],
        ),
      ),
    );
  }
}
