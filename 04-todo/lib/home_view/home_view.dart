import 'package:flutter/material.dart';
import 'package:todo_app/home_view/home_app_bar.dart';

import '../models/todo_model.dart';
import '../widgets/app_empty_view.dart';
import '../widgets/app_floating_button.dart';
import 'todo_list/todo_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int todoId = 0;

  List<TodoModel> activeTodos = [];
  List<TodoModel> completedTodos = [];

  TextEditingController textController = TextEditingController();

  void addNewTodoItem(String titleValue) {
    if (titleValue.isNotEmpty) {
      setState(() {
        final newTodo = TodoModel(
          id: todoId++,
          title: titleValue,
        );
        activeTodos.add(newTodo);
        // textController.text = '';
        textController.clear();
      });
      FocusScope.of(context).unfocus();
    }
  }

  void markTodoAsCompleted(int id) {
    // 1- Get index of ActiveTodo Item
    final activeItemIndex = activeTodos.indexWhere((item) => item.id == id);

    // 2- Create a copy of ActiveTodo Item and update its completed prop to => True
    activeTodos[activeItemIndex].completed = true;

    setState(() {
      // 3- Add the modified Todo Item to the CompletedTodos list
      completedTodos.add(activeTodos[activeItemIndex]);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // 4- Remove the CompletedTodo Item from ActiveTodos List
        activeTodos.removeAt(activeItemIndex);
      });
    });
  }

  void markTodoAsActive(int id) {
    // 1- Get CompletedTodo Item
    final completedTodoItem =
        completedTodos.firstWhere((item) => item.id == id);

    // 2- update completed property to => False
    completedTodoItem.completed = true;

    // 3- Add the modified Todo Item to the ActiveTodos list
    activeTodos.add(completedTodoItem);

    setState(() {
      // 4- Remove the ActiveTodo Item from CompletedTodos List
      completedTodos.removeWhere((item) => item.id == id);
    });
  }

  void removeTodo(TodoModel todoItem) {
    if (todoItem.completed) {
      setState(() {
        completedTodos.removeWhere((item) => item.id == todoItem.id);
      });
    } else {
      setState(() {
        activeTodos.removeWhere((item) => item.id == todoItem.id);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

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
                // Home AppBar
                HomeAppBar(
                  textController: textController,
                  addNewTodoItem: addNewTodoItem,
                ),

                // TabBar
                const SizedBox(
                    child: ColoredBox(
                  color: Colors.black87,
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
                    color: Colors.black87,
                    child: TabBarView(
                      children: [
                        activeTodos.isEmpty
                            ? const AppEmptyView()
                            : TodoList(
                                activeTodos,
                                markTodoAsCompleted,
                                markTodoAsActive,
                                removeTodo,
                              ),
                        completedTodos.isEmpty
                            ? const AppEmptyView()
                            : TodoList(
                                completedTodos,
                                markTodoAsCompleted,
                                markTodoAsActive,
                                removeTodo,
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
      ),
    );
  }
}
