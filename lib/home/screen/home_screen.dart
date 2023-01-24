import 'package:flutter/material.dart';

import '../widgets/sugessition.dart';
import 'main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Suggestions(),
        ),
      ),
    );
  }
}
