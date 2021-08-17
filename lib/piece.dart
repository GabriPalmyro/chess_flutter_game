import 'package:flutter/material.dart';

class Piece extends StatelessWidget {
  //tipo de peça || x = vazio || o = possivel movimento
  final String peca;

  // movimento de possivel morte
  final String killMove;

  // cor da peça
  final String cor;

  // a peça é a que está selecionada
  final String estaPecaSelecionada;

  // função do tap
  final onTap;

  Piece(
      {this.peca,
      this.cor,
      this.onTap,
      this.estaPecaSelecionada,
      this.killMove});

  @override
  Widget build(BuildContext context) {
    if (killMove == 'k') {
      //morte possivel
      return GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.red[200].withOpacity(0.8),
          padding: const EdgeInsets.all(10),
          child: Image.asset('lib/images/' + cor + peca + '.png'),
        ),
      );
    } else if (peca == 'o') {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.yellow[200].withOpacity(0.6),
        ),
      );
    } else if (peca != 'x') {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          color: estaPecaSelecionada == 'selected'
              ? Colors.green[300].withOpacity(0.6)
              : Colors.transparent,
          padding: const EdgeInsets.all(10),
          child: Image.asset('lib/images/' + cor + peca + '.png'),
        ),
      );
    }
    return Container();
  }
}
