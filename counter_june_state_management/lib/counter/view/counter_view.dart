import 'package:flutter/material.dart';
import 'package:june/instance/src/extension_instance.dart';
import 'package:june/state_manager.dart';

import '../june_view_model.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = June.getState(CounterVM());

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: JuneBuilder(
          () => CounterVM(),
          builder: (controller) => Text(
            "${controller.count}",
            style: textTheme.displayMedium,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                state.count++;
                state.setState();
              }),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => state.decreament(),
          ),
        ],
      ),
    );
  }
}
