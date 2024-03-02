import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/utils/theme_cubit.dart';

import '../constants.dart';
import '../widgets/app_textfield.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(
        vertical: kPadding32,
        horizontal: kPadding16,
      ),
      decoration: BoxDecoration(
        gradient: Theme.of(context).brightness == Brightness.dark
            ? kDarkLinearGradient
            : kLightLinearGradient,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TODO",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 8,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                icon: Icon(
                  color: Colors.white,
                  context.watch<ThemeCubit>().state == ThemeMode.dark
                      ? Icons.wb_sunny
                      : Icons.dark_mode,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kPadding24,
          ),

          // App TextField
          const AppTextField(),
        ],
      ),
    );
  }
}
