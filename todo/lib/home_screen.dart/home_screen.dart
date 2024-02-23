import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/home_screen.dart/app_todo.dart';

import '../models/todo.dart';
import '../widgets/app_floating_button.dart';
import 'todo_list/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];

  TextEditingController textController = TextEditingController();

  void addNewTodoItem(String value) {
    if (textController.text.isNotEmpty) {
      setState(() {
        textController.text = value;
        final todo = Todo(title: textController.text);
        todoList.add(todo);
        textController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            // App Todo
            AppTodo(
              todoList: todoList,
              textController: textController,
              addNewTodoItem: addNewTodoItem,
            ),

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
            if (todoList.isEmpty)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   height: kPadding64,
                    // ),
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
              )
            else
              Expanded(
                child: Container(
                  color: kColorBlack87,
                  child: TabBarView(
                    children: [
                      // Todo List
                      TodoList(todoList: todoList),
                      const Icon(Icons.directions_transit, size: 350),
                    ],
                  ),
                ),
              ),
          ],
        ),
        floatingActionButton: AppFloatingButton(
          todoList: todoList,
          addNewTodoItem: () {
            addNewTodoItem(textController.text);
          },
        ),
      ),
    );
  }
}
