import 'package:flutter/material.dart';
import 'package:pontuador_robolab/core/atom/shared_atom.dart';

class GangorrasWidget extends StatefulWidget {
  const GangorrasWidget({Key? key}) : super(key: key);

  @override
  _GangorrasWidgetState createState() => _GangorrasWidgetState();
}

class _GangorrasWidgetState extends State<GangorrasWidget> {
  List<bool> buttonStates = List.generate(6, (index) => false);

  void atualizarPontos() {
    int novoPonto = 0;
    for (int i = 0; i < buttonStates.length; i++) {
      if (buttonStates[i]) {
        novoPonto += 15;
      }
    }
    SharedAtom.pontos3 = novoPonto;
  }

  void atualizarEstado(int index) {
    setState(() {
      buttonStates[index] = !buttonStates[index];
    });
    atualizarPontos();
  }

  int getPoints() {
    int pontos = 0;
    for (int i = 0; i < buttonStates.length; i++) {
      if (buttonStates[i]) {
        pontos += 15;
      }
    }
    return pontos;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double buttonSize = constraints.maxWidth / 8;
              return Wrap(
                spacing: buttonSize / 4,
                runSpacing: buttonSize / 4,
                children: List.generate(6, (index) {
                  final buttonText = (index + 1).toString();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        buttonStates[index] = !buttonStates[index];
                        atualizarPontos();
                      });
                    },
                    child: Container(
                      width: buttonSize,
                      height: buttonSize,
                      decoration: BoxDecoration(
                        color: buttonStates[index] ? Colors.green : Colors.green,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.green,
                          width: buttonSize / 4,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            color: buttonStates[index] ? Colors.white : Colors.black,
                            fontSize: buttonSize / 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Pontos: ${getPoints()}',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
