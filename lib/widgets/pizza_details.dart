import 'package:flutter/material.dart';

import '../model/pizza_model.dart';

class PizzaDetails extends StatelessWidget {
  final Pizza pizzadetail;
  const PizzaDetails({super.key, required this.pizzadetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\$${pizzadetail.price}",
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 87, 147, 215),
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          pizzadetail.description,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 12,
              height: 1.2,
              color: Colors.grey[500],
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
