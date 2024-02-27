import 'package:bloc/bloc.dart';
import 'package:todo_app/models/todo.dart';

import 'cubit/todo_cubit.dart';

class TodoBlocObserver extends BlocObserver {
  const TodoBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is TodoCubit) {
      // Check if the bloc is TodoCubit
      final currentState = change.currentState as List<Todo>;
      final nextState = change.nextState as List<Todo>;

      print(
          '${bloc.runtimeType} Change { currentState: ${currentState.map((todo) => todo.title)}, nextState: ${nextState.map((todo) => todo.title)} }');
    }
  }
}
