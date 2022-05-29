import 'package:arcanth_shop/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Pesquisar...",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(defaultPadding / 1.2),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
          filled: true,
          fillColor: Colors.white,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(defaultBorderRadius),
  ),
  borderSide: BorderSide.none,
);
