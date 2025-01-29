import 'package:flutter/material.dart';

class HabilidadesBox extends StatelessWidget {
  final List<Map<String, dynamic>> habilidades;
  final Function(String, int) onChanged;

  const HabilidadesBox(
      {super.key, required this.habilidades, required this.onChanged});

  @override
  Widget build(BuildContext context) {
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
          const Center(
            child: Text(
              "Habilidades",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: habilidades
                      .sublist(0, habilidades.length ~/ 3)
                      .map((habilidade) => _habilidadeRow(
                          habilidade["nome"], habilidade["valor"]))
                      .toList(),
                ),
              ),
              Expanded(
                child: Column(
                  children: habilidades
                      .sublist(
                          habilidades.length ~/ 3, 2 * habilidades.length ~/ 3)
                      .map((habilidade) => _habilidadeRow(
                          habilidade["nome"], habilidade["valor"]))
                      .toList(),
                ),
              ),
              Expanded(
                child: Column(
                  children: habilidades
                      .sublist(2 * habilidades.length ~/ 3)
                      .map((habilidade) => _habilidadeRow(
                          habilidade["nome"], habilidade["valor"]))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _habilidadeRow(String nome, int valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              nome,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () => onChanged(nome, index + 1),
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
}
