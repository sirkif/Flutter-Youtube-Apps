import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/home/app_todo.dart';

import '../models/todo_model.dart';
import '../utils/service_locator.dart';
import '../widgets/app_empty_view.dart';
import '../widgets/app_floating_button.dart';
import 'todo_list/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> activeList = [];
  List<TodoModel> completedList = [];

  final textController = TextControllerSingleton.textEditingController;

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
  Widget build(BuildContext context) {
    final focusScope = FocusScope.of(context);
    final TodoCubit contextWatch = context.watch<TodoCubit>();
    // final List<Todo> completedList = context.watch<TodoCubit>().state;
    final TodoCubit contextRead = context.read<TodoCubit>();

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: GestureDetector(
          onTap: () {
            focusScope.unfocus();
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
                        contextWatch.state.isEmpty
                            ? const AppEmptyView()
                            : TodoList(
                                todoList: contextWatch.state,
                                markTodoAsActive: markTodoAsActive,
                              ),
                        // BlocBuilder<TodoCubit, List<Todo>>(
                        //   builder: (context, state) {
                        //     if (state.isEmpty) {
                        //       const AppEmptyView();
                        //     }
                        //     return TodoList(
                        //       markTodoAsActive: markTodoAsActive,
                        //     );
                        //   },
                        // ),
                        contextWatch.completedList.isEmpty
                            ? const AppEmptyView()
                            : TodoList(
                                todoList: contextWatch.completedList,
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
                contextRead.addNewTodoItem(textController.text);
                textController.clear();
                focusScope.unfocus();
              },
            ),
          ),
        ),
      ),
    );
  }
}
