import 'package:june/state_manager.dart';

class CounterVM extends JuneState {
  int count = 0;

  void decreament() {
    count--;
    setState();
  }
}
