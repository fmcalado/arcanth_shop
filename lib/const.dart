import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
List<String> cartProducts = [];


String supabaseAPIURL = 'https://tohxzlvhrqympnmudfkj.supabase.co';
String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRvaHh6bHZocnF5bXBubXVkZmtqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTM1Mjc1MDMsImV4cCI6MTk2OTEwMzUwM30.oNQJ0FdJiTKOUAIm8-IA2PjMtc6YnmIHwyySAJ3HxLk';

const Color primaryColor = Color(0xFFF67952);
const Color bgColor = Color(0xFFFBFBFD);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;
const double defaultHeight = 18;
const String lipsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nisl lacus, efficitur quis vulputate vel, iaculis tempor nisl. Ut tortor nulla, vehicula ut sem eu, mollis faucibus augue.";

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

Map<int, Color> colorCustom = {
  50: const Color.fromRGBO(18, 18, 18, .1),
  100: const Color.fromRGBO(18, 18, 18, .2),
  200: const Color.fromRGBO(18, 18, 18, .3),
  300: const Color.fromRGBO(18, 18, 18, .4),
  400: const Color.fromRGBO(18, 18, 18, .5),
  500: const Color.fromRGBO(18, 18, 18, .6),
  600: const Color.fromRGBO(18, 18, 18, .7),
  700: const Color.fromRGBO(18, 18, 18, .8),
  800: const Color.fromRGBO(18, 18, 18, .9),
  900: const Color.fromRGBO(18, 18, 18, 1),
};
MaterialColor arcanthColor = MaterialColor(0xFF121212, colorCustom);
