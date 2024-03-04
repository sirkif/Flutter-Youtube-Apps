import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';
import '../widgets/app_empty_view.dart';
import 'home_app_bar.dart';
import 'todo_list/todo_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  Color tabBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black87
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final activeTodos = context.watch<TodoProvider>().activeTodos;
    final completedTodos = context.watch<TodoProvider>().completedTodos;

    return Column(
      children: [
        // Home AppBar
        const HomeAppBar(),

        // TabBar
        SizedBox(
            child: ColoredBox(
          color: tabBackgroundColor(context),
          child: const TabBar(
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
            color: tabBackgroundColor(context),
            child: TabBarView(
              children: [
                // Active Tab
                activeTodos.isEmpty
                    ? const AppEmptyView()
                    : TodoList(
                        todoList: activeTodos,
                      ),

                // Completed Tab
                completedTodos.isEmpty
                    ? const AppEmptyView()
                    : TodoList(
                        todoList: completedTodos,
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
