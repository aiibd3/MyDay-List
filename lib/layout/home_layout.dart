import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'HomeLayout';

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyDay",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
