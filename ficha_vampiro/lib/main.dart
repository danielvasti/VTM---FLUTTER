import 'package:flutter/material.dart';
import 'screens/character_sheet.dart'; // Importa a tela da ficha

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ficha de Vampiro',
      theme: ThemeData.dark(), // Tema escuro para combinar com o RPG
      home: CharacterSheet(), // Define a ficha como a tela inicial
    );
  }
}
