import 'package:flutter/material.dart';
import 'package:pontuador_robolab/core/atom/shared_atom.dart';

class PontuacaoFinal extends StatelessWidget with RouteAware {
  const PontuacaoFinal({super.key});

  @override
  Widget build(BuildContext context) {
    int pontosSoma = SharedAtom.pontos +
        SharedAtom.pontos1 +
        SharedAtom.pontos2 +
        SharedAtom.pontos3 +
        SharedAtom.pontos4 +
        SharedAtom.pontos5 +
        SharedAtom.pontos6 +
        SharedAtom.pontos7 +
        SharedAtom.pontos8 +
        SharedAtom.pontos9;

    num resultado = ((((pontosSoma * SharedAtom.pontos13) * SharedAtom.pontos10) * SharedAtom.pontos11) * SharedAtom.pontos12);
    String result = resultado.toStringAsFixed(2);
    double result2 = double.parse(result);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pontuação Final'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Pontuação Final',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              '$result2',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                // Isso garantirá que a tela principal seja exibida ao retornar da pontuação final.
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Voltar à Tela Inicial',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10), // Adicionei um espaço entre os botões
            ElevatedButton(
              onPressed: () {
                SharedAtom.resetPontuacao(); // Chama a função para reiniciar as variáveis de estado
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Zerar Pontuação',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
