import 'package:arcanth_shop/components/home/search_form.dart';
import 'package:flutter/material.dart';

import 'package:arcanth_shop/const.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A Loja Ideal",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const Text(
            "para suas compras",
            style: TextStyle(fontSize: 18),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: SearchForm(),
          ),
        ],
      ),
    );
  }
}
