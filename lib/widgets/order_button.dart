import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.sizeOf(context).width * 0.9, 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              backgroundColor: Theme.of(context).colorScheme.secondary),
          onPressed: () {},
          child: const Text(
            "Order Now",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
          )),
    );
  }
}
