import 'package:flutter/material.dart';

import 'main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Text(
            'home',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
