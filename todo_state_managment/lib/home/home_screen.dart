import 'package:flutter/material.dart';
import 'package:june/state_manager.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home/app_todo.dart';
import 'package:todo_app/home/home_view_model/home_view_model.dart';

import '../widgets/app_empty_view.dart';
import '../widgets/app_floating_button.dart';
import 'todo_list/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            body: Column(
              children: [
                // App Todo
                const AppTodo(),

                // Tab Bar
                const SizedBox(
                    child: ColoredBox(
                  color: kColorBlack87,
                  child: TabBar(
                    // labelColor: Colors.greenAccent,
                    // indicatorColor: Colors.yellow,
                    // indicatorSize: TabBarIndicatorSize.tab,
                    // indicator: BoxDecoration(
                    //   color: Colors.white,
                    // ),
                    tabs: [
                      Tab(
                        text: "Active",
                      ),
                      Tab(
                        text: "Completed",
                      ),
                    ],
                  ),
                )),

                Expanded(
                  child: Container(
                    color: kColorBlack87,
                    child: TabBarView(
                      children: [
                        JuneBuilder(
                          () => TodoViewModel(),
                          builder: (controller) =>
                              controller.activeTodos.isEmpty
                                  ? const AppEmptyView()
                                  : TodoList(
                                      todoList: controller.activeTodos,
                                    ),
                        ),
                        JuneBuilder(
                          () => TodoViewModel(),
                          builder: (controller) =>
                              controller.completedTodos.isEmpty
                                  ? const AppEmptyView()
                                  : TodoList(
                                      todoList: controller.completedTodos,
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: AppFloatingButton(),
          ),
        ),
      ),
    );
  }
}
