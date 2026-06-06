import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        "My Blog App",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
