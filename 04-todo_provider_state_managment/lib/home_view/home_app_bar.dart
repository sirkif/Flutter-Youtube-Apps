import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

import '../constants.dart';
import '../widgets/app_textfield.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

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
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  color: Colors.white,
                  themeProvider.isDarkMode ? Icons.wb_sunny : Icons.dark_mode,
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
