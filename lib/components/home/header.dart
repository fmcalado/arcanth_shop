import 'package:arcanth_shop/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:arcanth_shop/const.dart';

AppBar headerComponent(BuildContext context) {
  Future<void> _signOut() async {
    final response = await supabase.auth.signOut();
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    }
  }

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        _signOut();
      },
      icon: SvgPicture.asset("assets/icons/out.svg", height: 30),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
        icon: SvgPicture.asset("assets/icons/cart.svg", height: 28),
      ),
    ],
  );
}
