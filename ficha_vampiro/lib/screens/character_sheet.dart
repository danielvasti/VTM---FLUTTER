import 'package:flutter/material.dart';
import 'package:ficha_vampiro/game_data.dart'; // Importa os Clãs
import 'habilidades_box.dart'; // Importa o widget de Habilidades

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

  // Habilidades
  int empatiaComAnimais = 1;
  int academicos = 1;
  int briga = 1;
  int etiqueta = 1;
  int prontidao = 1;
  int empatia = 1;
  int financas = 1;
  int conducao = 1;
  int intimidacao = 1;
  int investigacao = 1;
  int armasDeFogo = 1;
  int lideranca = 1;
  int medicina = 1;
  int furto = 1;
  int expressao = 1;
  int ocultismo = 1;
  int armasBrancas = 1;
  int persuasao = 1;
  int politica = 1;
  int furtividade = 1;
  int manha = 1;
  int ciencia = 1;
  int sobrevivencia = 1;
  int subterfugio = 1;
  int tecnologia = 1;
  int oficios = 1;

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
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () => onChanged(index + 1),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 20,
                  height: 20,
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
    return Container(
      width: MediaQuery.of(context).size.width / 3 -
          24, // Ajuste o tamanho dos blocos de atributos
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...atributos,
        ],
      ),
    );
  }

  Widget linhaDivisoria() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 1,
        color: Colors.white,
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  SizedBox(
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
                      decoration: const InputDecoration(
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
                  SizedBox(
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
              linhaDivisoria(),
              // Habilidades
              HabilidadesBox(
                habilidades: [
                  {"nome": "Empatia com Animais", "valor": empatiaComAnimais},
                  {"nome": "Acadêmicos", "valor": academicos},
                  {"nome": "Briga", "valor": briga},
                  {"nome": "Etiqueta", "valor": etiqueta},
                  {"nome": "Prontidão", "valor": prontidao},
                  {"nome": "Empatia", "valor": empatia},
                  {"nome": "Finanças", "valor": financas},
                  {"nome": "Condução", "valor": conducao},
                  {"nome": "Intimidação", "valor": intimidacao},
                  {"nome": "Investigação", "valor": investigacao},
                  {"nome": "Armas de Fogo", "valor": armasDeFogo},
                  {"nome": "Liderança", "valor": lideranca},
                  {"nome": "Medicina", "valor": medicina},
                  {"nome": "Furto", "valor": furto},
                  {"nome": "Expressão", "valor": expressao},
                  {"nome": "Ocultismo", "valor": ocultismo},
                  {"nome": "Armas Brancas", "valor": armasBrancas},
                  {"nome": "Persuasão", "valor": persuasao},
                  {"nome": "Política", "valor": politica},
                  {"nome": "Furtividade", "valor": furtividade},
                  {"nome": "Manha", "valor": manha},
                  {"nome": "Ciência", "valor": ciencia},
                  {"nome": "Sobrevivência", "valor": sobrevivencia},
                  {"nome": "Subterfúgio", "valor": subterfugio},
                  {"nome": "Tecnologia", "valor": tecnologia},
                  {"nome": "Ofícios", "valor": oficios},
                ],
                onChanged: (nome, valor) {
                  setState(() {
                    switch (nome) {
                      case "Empatia com Animais":
                        empatiaComAnimais = valor;
                        break;
                      case "Acadêmicos":
                        academicos = valor;
                        break;
                      case "Briga":
                        briga = valor;
                        break;
                      case "Etiqueta":
                        etiqueta = valor;
                        break;
                      case "Prontidão":
                        prontidao = valor;
                        break;
                      case "Empatia":
                        empatia = valor;
                        break;
                      case "Finanças":
                        financas = valor;
                        break;
                      case "Condução":
                        conducao = valor;
                        break;
                      case "Intimidação":
                        intimidacao = valor;
                        break;
                      case "Investigação":
                        investigacao = valor;
                        break;
                      case "Armas de Fogo":
                        armasDeFogo = valor;
                        break;
                      case "Liderança":
                        lideranca = valor;
                        break;
                      case "Medicina":
                        medicina = valor;
                        break;
                      case "Furto":
                        furto = valor;
                        break;
                      case "Expressão":
                        expressao = valor;
                        break;
                      case "Ocultismo":
                        ocultismo = valor;
                        break;
                      case "Armas Brancas":
                        armasBrancas = valor;
                        break;
                      case "Persuasão":
                        persuasao = valor;
                        break;
                      case "Política":
                        politica = valor;
                        break;
                      case "Furtividade":
                        furtividade = valor;
                        break;
                      case "Manha":
                        manha = valor;
                        break;
                      case "Ciência":
                        ciencia = valor;
                        break;
                      case "Sobrevivência":
                        sobrevivencia = valor;
                        break;
                      case "Subterfúgio":
                        subterfugio = valor;
                        break;
                      case "Tecnologia":
                        tecnologia = valor;
                        break;
                      case "Ofícios":
                        oficios = valor;
                        break;
                    }
                  });
                },
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
