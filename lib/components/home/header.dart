import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:arcanth_shop/const.dart';

AppBar headerComponent(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset("assets/icons/menu.svg"),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: defaultPadding / 2),
        Text(
          "Arcanth Shop",
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/Heart.svg"),
      ),
    ],
  );
}
