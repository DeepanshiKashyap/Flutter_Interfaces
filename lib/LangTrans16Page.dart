
import 'package:flutter/material.dart';
import 'package:sih_main_page/language_translation.dart';

void main() {
  runApp(const Translator());
}

class Translator extends StatelessWidget {
  const Translator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Translator Application',
      debugShowCheckedModeBanner: false,
      home: LanguageTranslationPage(),
    );
  }
}