import 'package:flutter/material.dart';

class CharacterSheet extends StatefulWidget {
  @override
  _CharacterSheetState createState() => _CharacterSheetState();
}

class _CharacterSheetState extends State<CharacterSheet> {
  // Atributos Físicos
  int forca = 1;
  int destreza = 1;
  int vigor = 1;

  // Atributos Sociais
  int carisma = 1;
  int manipulacao = 1;
  int aparencia = 1;

  // Atributos Mentais
  int percepcao = 1;
  int inteligencia = 1;
  int raciocinio = 1;

  // Informações do personagem
  String nome = "";
  String nomeJogador = "";
  String idade = "";
  String clan = "";
  String tipoPredador = "";
  String ambicao = "";
  String desejo = "";
  String conceito = "";
  String outraInfo = "";

  Widget atributoRow(String nome, int valor, Function(int) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 110, // Define um tamanho fixo para os nomes dos atributos
            child: Text(
              nome,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () => onChanged(index + 1),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 24, // Tamanho fixo para os pontos
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < valor ? Colors.red : Colors.grey[800],
                    border: Border.all(color: Colors.white),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget blocoAtributos(String titulo, List<Widget> atributos) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...atributos,
          ],
        ),
      ),
    );
  }

  Widget blocoInformacoes(String titulo, List<Widget> campos) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          // Usando Wrap para colocar os campos lado a lado
          Wrap(
            spacing: 16, // Espaçamento horizontal entre os campos
            runSpacing: 16, // Espaçamento vertical entre as linhas de campos
            children: campos,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ficha de Vampiro")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Informações do personagem
              blocoInformacoes("Informações do Personagem", [
                _campoTexto("Nome", (value) => setState(() => nome = value)),
                _campoTexto("Nome do Jogador",
                    (value) => setState(() => nomeJogador = value)),
                _campoTexto("Idade", (value) => setState(() => idade = value)),
                _campoTexto("Clã", (value) => setState(() => clan = value)),
                _campoTexto("Tipo de Predador",
                    (value) => setState(() => tipoPredador = value)),
                _campoTexto(
                    "Ambição", (value) => setState(() => ambicao = value)),
                _campoTexto(
                    "Desejo", (value) => setState(() => desejo = value)),
                _campoTexto(
                    "Conceito", (value) => setState(() => conceito = value)),
                _campoTexto("Outra Informação",
                    (value) => setState(() => outraInfo = value)),
              ]),

              // Atributos Físicos, Sociais e Mentais
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blocoAtributos("Físicos", [
                    atributoRow(
                        "Força", forca, (val) => setState(() => forca = val)),
                    atributoRow("Destreza", destreza,
                        (val) => setState(() => destreza = val)),
                    atributoRow(
                        "Vigor", vigor, (val) => setState(() => vigor = val)),
                  ]),
                  blocoAtributos("Sociais", [
                    atributoRow("Carisma", carisma,
                        (val) => setState(() => carisma = val)),
                    atributoRow("Manipulação", manipulacao,
                        (val) => setState(() => manipulacao = val)),
                    atributoRow("Aparência", aparencia,
                        (val) => setState(() => aparencia = val)),
                  ]),
                  blocoAtributos("Mentais", [
                    atributoRow("Percepção", percepcao,
                        (val) => setState(() => percepcao = val)),
                    atributoRow("Inteligência", inteligencia,
                        (val) => setState(() => inteligencia = val)),
                    atributoRow("Raciocínio", raciocinio,
                        (val) => setState(() => raciocinio = val)),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Campo de texto genérico para informações do personagem
  Widget _campoTexto(String label, Function(String) onChanged) {
    return SizedBox(
      width: 150,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
