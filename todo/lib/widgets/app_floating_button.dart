import 'package:flutter/material.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      onPressed: () {
        // Add your onPressed logic here
      },
      child: const Icon(Icons.add),
    );
  }
}
