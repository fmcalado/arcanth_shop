import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    Key? key,
    required this.sectionTitle,
    required this.onPress,
  }) : super(key: key);

  final String sectionTitle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: onPress,
          child: const Text("Ver todos"),
        )
      ],
    );
  }
}