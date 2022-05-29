import 'package:flutter/material.dart';
import 'package:arcanth_shop/components/home/body.dart';
import 'package:arcanth_shop/components/home/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerComponent(context),
      body: const HomeBody(),
    );
  }
}
