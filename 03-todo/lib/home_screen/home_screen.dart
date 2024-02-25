import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home_screen/app_todo.dart';

import '../models/todo.dart';
import '../widgets/app_empty_view.dart';
import '../widgets/app_floating_button.dart';
import 'todo_list/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> activeList = [];
  List<Todo> completedList = [];

  TextEditingController textController = TextEditingController();

  void addNewTodoItem(String value) {
    if (textController.text.isNotEmpty) {
      setState(() {
        textController.text = value;
        final activeTodo = Todo(
          title: textController.text.trim(),
        );
        activeList.add(activeTodo);
        textController.text = '';
      });
      FocusScope.of(context).unfocus();
    }
  }

  void markTodoAsCompleted(String id) {
    setState(() {
      final todo = activeList.firstWhere(
        (todoItem) => todoItem.id == id,
      );

      todo.completed = true;

      completedList.add(todo);
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        activeList.removeWhere((todoItem) => todoItem.id == id);
      });
    });
  }

  void markTodoAsActive(String id) {
    setState(() {
      final todo = completedList.firstWhere(
        (todoItem) => todoItem.id == id,
      );

      todo.completed = false;

      activeList.add(todo);
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        completedList.removeWhere((todoItem) => todoItem.id == id);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            children: [
              // App Todo
              AppTodo(
                textController: textController,
                addNewTodoItem: addNewTodoItem,
              ),

              // TabBar
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

              // TabBarView
              Expanded(
                child: Container(
                  color: kColorBlack87,
                  child: TabBarView(
                    children: [
                      activeList.isEmpty
                          ? const AppEmptyView()
                          : TodoList(
                              todoList: activeList,
                              markTodoAsCompleted: markTodoAsCompleted,
                              markTodoAsActive: markTodoAsActive,
                            ),
                      completedList.isEmpty
                          ? const AppEmptyView()
                          : TodoList(
                              todoList: completedList,
                              markTodoAsCompleted: markTodoAsCompleted,
                              markTodoAsActive: markTodoAsActive,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: AppFloatingButton(
            addNewTodoItem: () {
              addNewTodoItem(textController.text);
            },
          ),
        ),
      ),
    );
  }
}
