import 'package:flutter/material.dart';
import 'package:moroccan_tagine/constants.dart';
import 'package:moroccan_tagine/home_view/models/ingredients_model.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.ingredient,
  });

  final IngredientsModel ingredient;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
          color: kCardBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${ingredient.price} dhs",
            style: const TextStyle(
              color: Color(0xff343434),
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                "${ingredient.weight}kg",
                style: const TextStyle(
                  color: kTextSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                " - ${ingredient.name} - ",
                style: const TextStyle(
                  color: kTextSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "0${ingredient.id}",
                style: const TextStyle(
                  color: kTextSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
