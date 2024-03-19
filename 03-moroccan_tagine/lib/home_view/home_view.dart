import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moroccan_tagine/constants.dart';
import 'package:moroccan_tagine/home_view/models/ingredients_model.dart';
import 'package:moroccan_tagine/home_view/widgets/app_button.dart';

import 'widgets/app_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<IngredientsModel> ingredientsList = [];

  int id = 1;
  double totalPrice = 00.00;
  String textfieldValue = "";

  void addIngredients() {
    setState(() {
      ingredientsList.add(
        IngredientsModel(
          id: id++,
          weight: Random().nextInt(14) + 1,
          name: textfieldValue,
          price: (Random().nextDouble() * 50).toStringAsFixed(2),
        ),
      );
    });
  }

  void calculateTotalPrice() {
    setState(() {
      totalPrice = ingredientsList
          .map((item) => double.parse(item.price))
          .reduce((value, item) => value + item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Moroccan Tagine",
                style: GoogleFonts.reggaeOne(
                  textStyle: const TextStyle(
                    color: kTextPrimaryColor,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/tagine.png',
                width: 140,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      onSubmitted: (value) {
                        textfieldValue = value;
                        addIngredients();
                      },
                      onChanged: (value) {
                        textfieldValue = value;
                      },
                      decoration: const InputDecoration(
                        hintText: "المقادير",
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  AppButton(
                    text: "Add",
                    padHorizontal: 12,
                    onPressed: () {
                      addIngredients();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              for (var item in ingredientsList)
                AppCard(
                  ingredient: item,
                ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "${totalPrice.toStringAsFixed(2)} Dhs",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: kTextSecondaryColor,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                text: "Total price",
                padHorizontal: 64,
                onPressed: calculateTotalPrice,
              )
            ],
          ),
        ),
      ),
    );
  }
}
