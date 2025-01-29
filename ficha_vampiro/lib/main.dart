import 'package:flutter/material.dart';
import 'screens/character_sheet.dart'; // Importa a tela da ficha

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ficha de Vampiro',
      theme: ThemeData.dark(),
      home: const CharacterSheet(), // Define a ficha como a tela inicial
    );
  }
}
