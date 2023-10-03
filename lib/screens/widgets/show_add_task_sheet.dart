import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myday/shared/styles/app_colors.dart';

class ShowAddTaskSheet extends StatefulWidget {
  const ShowAddTaskSheet({super.key});

  @override
  State<ShowAddTaskSheet> createState() => _ShowAddTaskSheetState();
}

class _ShowAddTaskSheetState extends State<ShowAddTaskSheet> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Text("Add New Task :)",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pleas Enter Task Title";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                  label: const Text(
                    "Task Title",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primary),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pleas Enter Task Description";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                  label: const Text(
                    "Task Description",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primary),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Select Time",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            InkWell(
              onTap: () {
                chooseTaskDate(context);
              },
              child: Text(
                "2003/2/7",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  minimumSize: const Size(100, 40),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: const Text(
                  "add",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
          ],
        ),
      ),
    );
  }

  void chooseTaskDate(BuildContext context) {
    showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
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
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 36500),
      ),
    );
  }
}