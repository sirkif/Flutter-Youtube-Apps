import 'package:flutter/material.dart';
import 'package:todo_app/home_view/home_body.dart';

import '../widgets/app_floating_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: const HomeBody(),
            floatingActionButton: AppFloatingButton(),
          ),
        ),
      ),
    );
  }
}
