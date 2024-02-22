import 'package:flutter/material.dart';

import '../../constants.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      // padding: const EdgeInsets.only(top: -32),
      shrinkWrap: true, // Ensure the ListView takes only the space it needs
      padding: EdgeInsets.zero,
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: kDarkSecondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1.0,
                blurRadius: 1.0,
              ),
            ],
          ),
          child: Text(
            "Data $index",
          ),
        );
      },
    );
  }
}
