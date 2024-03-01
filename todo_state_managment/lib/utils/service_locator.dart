import 'package:flutter/material.dart';
import 'package:june/june.dart';

import '../home/home_view_model/home_view_model.dart';

class TextControllerInstance {
  static final TextEditingController textEditingController =
      TextEditingController();
}

class TodoViewModelInstance {
  static final TodoViewModel todoViewModel = June.getState(TodoViewModel());
}
