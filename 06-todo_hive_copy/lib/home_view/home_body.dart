import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo_model.dart';
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
    final todoProvider = context.watch<TodoProvider>();
    // final activeTodos = context.watch<TodoProvider>().activeTodos;
    // final completedTodos = context.watch<TodoProvider>().completedTodos;

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

        FutureBuilder<List<TodoModel>>(
          future: todoProvider.getTodoList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // Show error message if there's an error
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              // Show empty view if data is null or empty
              return const AppEmptyView();
            } else {
              // Render the TodoList widget with the fetched data
              return Expanded(
                child: Container(
                  color: tabBackgroundColor(context),
                  child: TabBarView(
                    children: [
                      // Active Tab
                      TodoList(todoList: snapshot.data!),

                      // Completed Tab
                      TodoList(todoList: todoProvider.completedTodos),
                    ],
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
