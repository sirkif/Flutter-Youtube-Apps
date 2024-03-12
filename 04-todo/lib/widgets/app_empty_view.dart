import 'package:flutter/material.dart';

import '../constants.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: kPadding64,
          ),
          Image.asset(
            'assets/empty_list.png',
            height: 110,
          ),
          const SizedBox(
            height: kPadding32,
          ),
          const Text(
            "Por Favor, Add a Task \u{1F60E}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
