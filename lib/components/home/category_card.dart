import 'package:arcanth_shop/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.iconURI,
    required this.categoryTitle,
    required this.press,
  }) : super(key: key);

  final String iconURI, categoryTitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultBorderRadius),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 4,
          vertical: defaultPadding / 2,
        ),
        child: Column(
          children: [
            SvgPicture.asset(iconURI),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              categoryTitle,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
