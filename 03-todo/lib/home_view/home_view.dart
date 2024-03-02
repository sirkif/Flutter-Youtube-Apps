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
  List<TodoModel> activeTodos = [];
  List<TodoModel> completedTodos = [];

  TextEditingController textController = TextEditingController();

  void addNewTodoItem(String titleValue) {
    if (titleValue.isNotEmpty) {
      setState(() {
        final newTodo = TodoModel(
          title: titleValue,
        );
        activeTodos.add(newTodo);
        // textController.text = '';
        textController.clear();
      });
      FocusScope.of(context).unfocus();
    }
  }

  void markTodoAsCompleted(String id) {
    // 1- Get index of ActiveTodo Item
    final activeItemIndex =
        activeTodos.indexWhere((todoItem) => todoItem.id == id);

    // 2- Create a copy of ActiveTodo Item and update its completed prop to => True
    final updatedItem = activeTodos[activeItemIndex].copyWith(completed: true);

    setState(() {
      // 3- Update the modified Active Todo Item
      activeTodos[activeItemIndex] = updatedItem;

      // 4- Add the modified Todo Item to the CompletedTodos list
      completedTodos.add(updatedItem);
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        // 5- Remove the CompletedTodo Item from ActiveTodos List
        activeTodos.removeAt(activeItemIndex);
      });
    });
  }

  void markTodoAsActive(String id) {
    // 1- Get CompletedTodo Item
    final completedTodoItem =
        completedTodos.firstWhere((todoItem) => todoItem.id == id);

    // 2- Create a copy of ActiveTodo Item and update its completed prop to => False
    final updatedItem = completedTodoItem.copyWith(completed: false);

    setState(() {
      // 3- Add the modified Todo Item to the ActiveTodos list
      activeTodos.add(updatedItem);

      // 4- Remove the ActiveTodo Item from CompletedTodos List
      completedTodos.removeWhere((todo) => todo.id != updatedItem.id);
    });
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
                                todoList: activeTodos,
                                markTodoAsCompleted: markTodoAsCompleted,
                                markTodoAsActive: markTodoAsActive,
                              ),
                        completedTodos.isEmpty
                            ? const AppEmptyView()
                            : TodoList(
                                todoList: completedTodos,
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
      ),
    );
  }
}
