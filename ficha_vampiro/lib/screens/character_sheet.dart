import 'package:flutter/material.dart';
import 'package:ficha_vampiro/game_data.dart'; // Importa os Clãs

class CharacterSheet extends StatefulWidget {
  const CharacterSheet({super.key});

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
  String clan = "";
  String seita = "";
  String jogador = "";
  String predador = "";
  String titulo = "";
  String cronica = "";
  String ambicao = "";
  String desejo = "";

  Widget atributoRow(String nome, int valor, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              nome,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () => onChanged(index + 1),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 24,
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
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...atributos,
          ],
        ),
      ),
    );
  }

  Widget blocoInformacoes(String titulo, List<List<Widget>> campos) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: campos
                .map(
                  (coluna) => Expanded(
                    child: Column(
                      children: coluna,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ficha de Vampiro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Informações do personagem
              blocoInformacoes("Informações do Personagem", [
                [
                  _campoTexto("Nome", (value) => setState(() => nome = value)),
                  Container(
                    height:
                        56, // Ajuste a altura para padronizar com os outros campos
                    child: DropdownButtonFormField<String>(
                      value: clan.isNotEmpty ? clan : null,
                      items: clans.map((String cl) {
                        return DropdownMenuItem<String>(
                          value: cl,
                          child: Text(cl),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          clan = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Clã",
                        border: OutlineInputBorder(),
                      ),
                      isExpanded:
                          true, // Isso ajuda a garantir que o Dropdown se expanda corretamente
                    ),
                  ),
                  _campoTexto(
                      "Seita", (value) => setState(() => seita = value)),
                ],
                [
                  _campoTexto(
                      "Jogador", (value) => setState(() => jogador = value)),
                  Container(
                    height:
                        56, // Ajuste a altura para padronizar com os outros campos
                    child: DropdownButtonFormField<String>(
                      value: predador.isNotEmpty ? predador : null,
                      items: predator.map((String prd) {
                        return DropdownMenuItem<String>(
                          value: prd,
                          child: Text(prd),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          predador = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "Predador",
                        border: OutlineInputBorder(),
                      ),
                      isExpanded:
                          true, // Isso ajuda a garantir que o Dropdown se expanda corretamente
                    ),
                  ),
                  _campoTexto(
                      "Título", (value) => setState(() => titulo = value)),
                ],
                [
                  _campoTexto(
                      "Crônica", (value) => setState(() => cronica = value)),
                  _campoTexto(
                      "Ambição", (value) => setState(() => ambicao = value)),
                  _campoTexto(
                      "Desejo", (value) => setState(() => desejo = value)),
                ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
