import 'package:chess/piece.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // numero de linhas = 8
  int linhas = 8;

  // numero de quadrados tabuleiro = 64
  int numeroDeQuadrados = 64;

  // variables
  // bool thisPieceIsSelected = false;
  int indexPecaSelecionada = -1;
  String corPecaSelecionada = 'white';
  String atualPecaSelecionada = '';

  // vez das brancas jogarem - primeiro as brancas
  bool whiteTurn = true;

  List<int> quadradosPretos = [
    //primeira linha
    0,
    2,
    4,
    6,
    //segunda linha
    9,
    11,
    13,
    15,
    //terceira linha
    0 + 16,
    2 + 16,
    4 + 16,
    6 + 16,
    //quarta linha
    9 + 16,
    11 + 16,
    13 + 16,
    15 + 16,
    //quinta linha
    0 + 2 * 16,
    2 + 2 * 16,
    4 + 2 * 16,
    6 + 2 * 16,
    //sexta linha
    9 + 2 * 16,
    11 + 2 * 16,
    13 + 2 * 16,
    15 + 2 * 16,
    //setima linha
    0 + 3 * 16,
    2 + 3 * 16,
    4 + 3 * 16,
    6 + 3 * 16,
    //oitava linha
    9 + 3 * 16,
    11 + 3 * 16,
    13 + 3 * 16,
    15 + 3 * 16,
  ];

  var pecasPretasMortas = [];
  var pecasBrancasMortas = [];

  //estado inicial das peças
  var pecas = [
    // [posição, peça, cor, selecionada, morte provavel]

    // peças pretas
    [0, 'rook', 'black', 'unselected', ''],
    [1, 'knight', 'black', 'unselected', ''],
    [2, 'bishop', 'black', 'unselected', ''],
    [3, 'queen', 'black', 'unselected', ''],
    [4, 'king', 'black', 'unselected', ''],
    [5, 'bishop', 'black', 'unselected', ''],
    [6, 'knight', 'black', 'unselected', ''],
    [7, 'rook', 'black', 'unselected', ''],
    [8, 'pawn', 'black', 'unselected', ''],
    [9, 'pawn', 'black', 'unselected', ''],
    [10, 'pawn', 'black', 'unselected', ''],
    [11, 'pawn', 'black', 'unselected', ''],
    [12, 'pawn', 'black', 'unselected', ''],
    [13, 'pawn', 'black', 'unselected', ''],
    [14, 'pawn', 'black', 'unselected', ''],
    [15, 'pawn', 'black', 'unselected', ''],

    // espaços vazios | x - vazio, o - possivel movimento, k - possible kill
    [16, 'x', '', '', ''],
    [17, 'x', '', '', ''],
    [18, 'x', '', '', ''],
    [19, 'x', '', '', ''],
    [20, 'x', '', '', ''],
    [21, 'x', '', '', ''],
    [22, 'x', '', '', ''],
    [23, 'x', '', '', ''],
    [24, 'x', '', '', ''],
    [25, 'x', '', '', ''],
    [26, 'x', '', '', ''],
    [27, 'x', '', '', ''],
    [28, 'x', '', '', ''],
    [29, 'x', '', '', ''],
    [30, 'x', '', '', ''],
    [31, 'x', '', '', ''],
    [32, 'x', '', '', ''],
    [33, 'x', '', '', ''],
    [34, 'x', '', '', ''],
    [35, 'x', '', '', ''],
    [36, 'x', '', '', ''],
    [37, 'x', '', '', ''],
    [38, 'x', '', '', ''],
    [39, 'x', '', '', ''],
    [40, 'x', '', '', ''],
    [41, 'x', '', '', ''],
    [42, 'x', '', '', ''],
    [43, 'x', '', '', ''],
    [44, 'x', '', '', ''],
    [45, 'x', '', '', ''],
    [46, 'x', '', '', ''],
    [47, 'x', '', '', ''],

    // espaços das peças brancas

    [48, 'pawn', 'white', 'unselected', ''],
    [49, 'pawn', 'white', 'unselected', ''],
    [50, 'pawn', 'white', 'unselected', ''],
    [51, 'pawn', 'white', 'unselected', ''],
    [52, 'pawn', 'white', 'unselected', ''],
    [53, 'pawn', 'white', 'unselected', ''],
    [54, 'pawn', 'white', 'unselected', ''],
    [55, 'pawn', 'white', 'unselected', ''],
    [56, 'rook', 'white', 'unselected', ''],
    [57, 'knight', 'white', 'unselected', ''],
    [58, 'bishop', 'white', 'unselected', ''],
    [59, 'king', 'white', 'unselected', ''],
    [60, 'queen', 'white', 'unselected', ''],
    [61, 'bishop', 'white', 'unselected', ''],
    [62, 'knight', 'white', 'unselected', ''],
    [63, 'rook', 'white', 'unselected', ''],
  ];

  var pecasTemp = [
    // [posição, peça, cor, selecionada, morte provavel]

    // peças pretas
    [0, 'rook', 'black', 'unselected', ''],
    [1, 'knight', 'black', 'unselected', ''],
    [2, 'bishop', 'black', 'unselected', ''],
    [3, 'queen', 'black', 'unselected', ''],
    [4, 'king', 'black', 'unselected', ''],
    [5, 'bishop', 'black', 'unselected', ''],
    [6, 'knight', 'black', 'unselected', ''],
    [7, 'rook', 'black', 'unselected', ''],
    [8, 'pawn', 'black', 'unselected', ''],
    [9, 'pawn', 'black', 'unselected', ''],
    [10, 'pawn', 'black', 'unselected', ''],
    [11, 'pawn', 'black', 'unselected', ''],
    [12, 'pawn', 'black', 'unselected', ''],
    [13, 'pawn', 'black', 'unselected', ''],
    [14, 'pawn', 'black', 'unselected', ''],
    [15, 'pawn', 'black', 'unselected', ''],

    // espaços vazios | x - vazio, o - possivel movimento, k - possible kill
    [16, 'x', '', '', ''],
    [17, 'x', '', '', ''],
    [18, 'x', '', '', ''],
    [19, 'x', '', '', ''],
    [20, 'x', '', '', ''],
    [21, 'x', '', '', ''],
    [22, 'x', '', '', ''],
    [23, 'x', '', '', ''],
    [24, 'x', '', '', ''],
    [25, 'x', '', '', ''],
    [26, 'x', '', '', ''],
    [27, 'x', '', '', ''],
    [28, 'x', '', '', ''],
    [29, 'x', '', '', ''],
    [30, 'x', '', '', ''],
    [31, 'x', '', '', ''],
    [32, 'x', '', '', ''],
    [33, 'x', '', '', ''],
    [34, 'x', '', '', ''],
    [35, 'x', '', '', ''],
    [36, 'x', '', '', ''],
    [37, 'x', '', '', ''],
    [38, 'x', '', '', ''],
    [39, 'x', '', '', ''],
    [40, 'x', '', '', ''],
    [41, 'x', '', '', ''],
    [42, 'x', '', '', ''],
    [43, 'x', '', '', ''],
    [44, 'x', '', '', ''],
    [45, 'x', '', '', ''],
    [46, 'x', '', '', ''],
    [47, 'x', '', '', ''],

    // espaços das peças brancas

    [48, 'pawn', 'white', 'unselected', ''],
    [49, 'pawn', 'white', 'unselected', ''],
    [50, 'pawn', 'white', 'unselected', ''],
    [51, 'pawn', 'white', 'unselected', ''],
    [52, 'pawn', 'white', 'unselected', ''],
    [53, 'pawn', 'white', 'unselected', ''],
    [54, 'pawn', 'white', 'unselected', ''],
    [55, 'pawn', 'white', 'unselected', ''],
    [56, 'rook', 'white', 'unselected', ''],
    [57, 'knight', 'white', 'unselected', ''],
    [58, 'bishop', 'white', 'unselected', ''],
    [59, 'king', 'white', 'unselected', ''],
    [60, 'queen', 'white', 'unselected', ''],
    [61, 'bishop', 'white', 'unselected', ''],
    [62, 'knight', 'white', 'unselected', ''],
    [63, 'rook', 'white', 'unselected', ''],
  ];

  void resetGame() {
    setState(() {
      pecas = pecasTemp;
      pecasPretasMortas = [];
      pecasBrancasMortas = [];
    });
  }

  void pecaSelecionada(int index) {
    // print(atualPecaSelecionada + ' + ' + corPecaSelecionada);

    //verificar se é um possível movimento
    if (pecas[index][1] == 'o' && index != indexPecaSelecionada) {
      setState(() {
        pecas[index][1] = pecas[indexPecaSelecionada][1]; //nome da peça
        pecas[index][2] = pecas[indexPecaSelecionada][2]; //cor da peça
        pecas[index][3] = 'unselected';
        pecas[indexPecaSelecionada][1] = 'x';
        pecas[indexPecaSelecionada][2] = '';
        pecas[indexPecaSelecionada][3] = '';
        whiteTurn = !whiteTurn;
      });

      descelecionarTudo();
    } else if (pecas[index][4] == 'k') {
      print(atualPecaSelecionada +
          ' ' +
          corPecaSelecionada +
          ' ataca ' +
          pecas[index][1] +
          ' ' +
          pecas[index][2]);
      setState(() {
        //adicionar a lista de peças mortas
        if (corPecaSelecionada == 'white') {
          pecasPretasMortas.add([pecas[index][1], pecas[index][2]]);
        } else {
          pecasBrancasMortas.add([pecas[index][1], pecas[index][2]]);
        }

        pecas[index][1] = pecas[indexPecaSelecionada][1]; //nome da peça
        pecas[index][2] = pecas[indexPecaSelecionada][2]; //cor da peça
        pecas[index][3] = 'unselected';
        pecas[indexPecaSelecionada][1] = 'x';
        pecas[indexPecaSelecionada][2] = '';
        pecas[indexPecaSelecionada][3] = '';
        whiteTurn = !whiteTurn;
      });

      descelecionarTudo();
    } else {
      descelecionarTudo();

      if ((whiteTurn && pecas[index][2] == 'white') ||
          (!whiteTurn && pecas[index][2] == 'black')) {
        setState(() {
          indexPecaSelecionada = index;
          corPecaSelecionada = pecas[index][2];
          pecas[index][3] = 'selected';
          atualPecaSelecionada = pecas[index][1];
        });

        switch (pecas[index][1]) {
          case 'pawn':
            clicouPeao(index);
            break;
          case 'rook':
            clicouTorre(index);
            break;
          case 'knight':
            clicouCavalo(index);
            break;
          case 'bishop':
            clicouBispo(index);
            break;
          case 'queen':
            tocouRainha(index);
            break;
          case 'king':
            break;
          default:
        }
      }
    }
  }

  void descelecionarTudo() {
    setState(() {
      for (int i = 0; i < pecas.length; i++) {
        pecas[i][3] = 'unselected';
        if (pecas[i][1] == 'o') {
          pecas[i][1] = 'x';
        }
        if (pecas[i][4] == 'k') {
          pecas[i][4] = '';
        }
      }
    });
  }

  void clicouPeao(int index) {
    setState(() {
      // peão selecionado é branco
      if (pecas[index][2] == 'white') {
        //verificar se há alguma peça na frente do peão
        if (pecas[index - linhas][1] != 'x') {
          // peão não pode realizar o movimento
        }
        // verificar se o peão está na segunda linha para poder avançar duas casas
        else if (index >= numeroDeQuadrados - 2 * linhas &&
            index <= numeroDeQuadrados - linhas) {
          if (pecas[index - linhas * 2][1] != 'x') {
            pecas[index - linhas][1] = 'o';
          } else {
            pecas[index - linhas][1] = 'o';
            pecas[index - linhas * 2][1] = 'o';
          }
        } else {
          // pode avançar uma casa
          pecas[index - linhas][1] = 'o';
        }

        // verificar se há peões para matar
        if (index % 8 != 7 &&
            pecas[index - linhas + 1][1] != 'x' &&
            pecas[index - linhas + 1][2] == 'black') {
          pecas[index - linhas + 1][4] = 'k';
        }

        if (index % 8 != 0 &&
            pecas[index - linhas - 1][1] != 'x' &&
            pecas[index - linhas - 1][2] == 'black') {
          pecas[index - linhas - 1][4] = 'k';
        }
      }
      // peão selecionado é preta
      else {
        //verificar se há alguma peça na frente do peão
        if (pecas[index + linhas][1] != 'x') {
          // peão não pode realizar o movimento
        }
        // verificar se o peão está na segunda linha para poder avançar duas casas
        else if (index <= 2 * linhas && index >= linhas) {
          if (pecas[index + linhas * 2][1] != 'x') {
            pecas[index + linhas][1] = 'o';
          } else {
            pecas[index + linhas][1] = 'o';
            pecas[index + linhas * 2][1] = 'o';
          }
        } else {
          // pode avançar uma casa
          pecas[index + linhas][1] = 'o';
        }

        // verificar se há peões para matar
        if (index % 8 != 7 &&
            pecas[index + linhas + 1][1] != 'x' &&
            pecas[index + linhas + 1][2] == 'white') {
          pecas[index + linhas + 1][4] = 'k';
        }

        if (index % 8 != 0 &&
            pecas[index + linhas - 1][1] != 'x' &&
            pecas[index + linhas - 1][2] == 'white') {
          pecas[index + linhas - 1][4] = 'k';
        }
      }
    });
  }

  void clicouTorre(int index) {
    // SENTIDO HORÁRIO
    setState(() {
      //CIMA
      for (int i = 1; i < 8; i++) {
        if (estaDentroDoTabuleiro(index - i * linhas)) {
          if (pecas[index - i * linhas][1] != 'x') {
            //se for uma peça de cor diferente
            if (corPecaSelecionada != pecas[index - i * linhas][2]) {
              //possível morte
              pecas[index - i * linhas][4] = 'k';
              //sair loop
              break;
            } else {
              //sair loop
              break;
            }
          } else {
            pecas[index - i * linhas][1] = 'o';
          }
        }
      }

      //DIREITA
      for (int i = 1; i < 8; i++) {
        if (estaDentroDoTabuleiro(index + i) &&
            qualLinhaEsta(index) == qualLinhaEsta(index + i)) {
          if (pecas[index + i][1] != 'x') {
            if (corPecaSelecionada != pecas[index + i][2]) {
              //possível morte
              pecas[index + i][4] = 'k';
              //sair loop
              break;
            } else {
              //sair loop
              break;
            }
          } else {
            pecas[index + i][1] = 'o';
          }
        } else {
          //sair loop
          break;
        }
      }

      //BAIXO
      for (int i = 1; i < 8; i++) {
        if (estaDentroDoTabuleiro(index + i * linhas)) {
          if (pecas[index + i * linhas][1] != 'x') {
            //se for uma peça de cor diferente
            if (corPecaSelecionada != pecas[index + i * linhas][2]) {
              //possível morte
              pecas[index + i * linhas][4] = 'k';
              //sair loop
              break;
            } else {
              //sair loop
              break;
            }
          } else {
            pecas[index + i * linhas][1] = 'o';
          }
        }
      }

      //ESQUERDA
      for (int i = 1; i < 8; i++) {
        if (estaDentroDoTabuleiro(index - i) &&
            qualLinhaEsta(index) == qualLinhaEsta(index - i)) {
          if (pecas[index - i][1] != 'x') {
            if (corPecaSelecionada != pecas[index - i][2]) {
              //possível morte
              pecas[index - i][4] = 'k';
              //sair loop
              break;
            } else {
              //sair loop
              break;
            }
          } else {
            pecas[index - i][1] = 'o';
          }
        } else {
          //sair loop
          break;
        }
      }
    });
  }

  void clicouCavalo(int index) {
    setState(() {
      // verificação horária

      List<int> movimentosValidos = [
        index - 2 * linhas - 1, // erro primeira coluna
        index - 2 * linhas + 1, // erro ultima coluna
        index + 2 * linhas - 1, // erro primeira coluna
        index + 2 * linhas + 1, // erro ultima coluna
        index - linhas + 2, // erro na primeira e segunda ultimas colunas
        index - linhas - 2, // erro na primeira e segunda coluna
        index + linhas + 2, // erro na primeira e segunda ultimas colunas
        index + linhas - 2, // erro na primeira e segunda coluna
      ];

      // filtro para facilitar quais quadrados podem ser válidos
      switch (index % 8) {
        // primeira coluna
        case 0:
          movimentosValidos = [
            index - 2 * linhas + 1, // erro primeira ultima
            index + 2 * linhas + 1, // erro ultima colun
            index - linhas + 2, // erro na primeira e segunda ultimas colunas
            index + linhas + 2, // erro na primeira e segunda ultimas colunas
          ];
          break;
        // segunda coluna
        case 1:
          movimentosValidos = [
            index - 2 * linhas - 1, // erro primeira coluna
            index - 2 * linhas + 1, // erro ultima coluna
            index + 2 * linhas - 1, // erro primeira coluna
            index + 2 * linhas + 1, // erro ultima coluna
            index - linhas + 2, // erro na primeira e segunda ultimas colunas
            index + linhas + 2, // erro na primeira e segunda ultimas colunas
          ];
          break;
        // penultima coluna
        case 6:
          movimentosValidos = [
            index - 2 * linhas - 1, // erro primeira coluna
            index - 2 * linhas + 1, // erro ultima coluna
            index + 2 * linhas - 1, // erro primeira coluna
            index + 2 * linhas + 1, // erro ultima coluna
            index - linhas - 2, // erro na primeira e segunda coluna
            index + linhas - 2, // erro na primeira e segunda coluna
          ];
          break;
        // ultima coluna
        case 7:
          movimentosValidos = [
            index - 2 * linhas - 1, // erro primeira coluna
            index + 2 * linhas - 1, // erro primeira coluna
            index - linhas - 2, // erro na primeira e segunda coluna
            index + linhas - 2, // erro na primeira e segunda coluna
          ];
          break;
        default:
      }

      setState(() {
        for (int i = 0; i < movimentosValidos.length; i++) {
          if (estaDentroDoTabuleiro(movimentosValidos[i])) {
            if (pecas[movimentosValidos[i]][1] == 'x') {
              pecas[movimentosValidos[i]][1] = 'o';
            } else {
              if (corPecaSelecionada != pecas[movimentosValidos[i]][2]) {
                pecas[movimentosValidos[i]][4] = 'k';
              }
            }
          }
        }
      });
    });
  }

  void clicouBispo(int index) {
    //sentido horario

    List<int> movimentosValidos = [];

    setState(() {
      // DIAGONAL ESQUERDA CIMA
      for (int i = 1; i < index % 8 + 1; i++) {
        //print((index - i) % 8);
        if (estaDentroDoTabuleiro(index - i * linhas - i)) {
          if (pecas[index - i * linhas - i][1] != 'x') {
            if (corPecaSelecionada != pecas[index - i * linhas - i][2]) {
              pecas[index - i * linhas - i][4] = 'k';
            }
            break;
          } else {
            movimentosValidos.add(index - i * linhas - i);
          }
        }
      }

      // DIAGONAL DIREITA CIMA
      for (int i = 1; i < 8 - index % 8; i++) {
        //print((index + i) % 8);
        if (estaDentroDoTabuleiro(index - i * linhas + i)) {
          if (pecas[index - i * linhas + i][1] != 'x') {
            if (corPecaSelecionada != pecas[index - i * linhas + i][2]) {
              pecas[index - i * linhas + i][4] = 'k';
            }
            break;
          } else {
            movimentosValidos.add(index - i * linhas + i);
          }
        }
      }

      // DIAGONAL DIREITA BAIXO
      for (int i = 1; i < 8 - index % 8; i++) {
        //print((index - i) % 8);
        if (estaDentroDoTabuleiro(index + i * linhas + i)) {
          if (pecas[index + i * linhas + i][1] != 'x') {
            if (corPecaSelecionada != pecas[index + i * linhas + i][2]) {
              pecas[index + i * linhas + i][4] = 'k';
            }
            break;
          } else {
            movimentosValidos.add(index + i * linhas + i);
          }
        }
      }

      // DIAGONAL ESQUERDA BAIXO
      for (int i = 1; i < index % 8 + 1; i++) {
        //print(8 - index % 8);
        if (estaDentroDoTabuleiro(index + i * linhas - i)) {
          if (pecas[index + i * linhas - i][1] != 'x') {
            if (corPecaSelecionada != pecas[index + i * linhas - i][2]) {
              pecas[index + i * linhas - i][4] = 'k';
            }
            break;
          } else {
            movimentosValidos.add(index + i * linhas - i);
          }
        }
      }

      for (int i = 0; i < movimentosValidos.length; i++) {
        pecas[movimentosValidos[i]][1] = 'o';
      }
    });
  }

  void tocouRainha(int index) {
    clicouTorre(index);
    clicouBispo(index);
  }

  bool estaDentroDoTabuleiro(int index) {
    if (index >= 0 && index < 64)
      return true;
    else
      return false;
  }

  // ignore: missing_return
  int qualLinhaEsta(int index) {
    if (index >= 0 && index <= 7) {
      return 0;
    } else if (index >= 8 && index <= 15) {
      return 1;
    } else if (index >= 16 && index <= 23) {
      return 2;
    } else if (index >= 24 && index <= 31) {
      return 3;
    } else if (index >= 32 && index <= 39) {
      return 4;
    } else if (index >= 40 && index <= 47) {
      return 5;
    } else if (index >= 48 && index <= 55) {
      return 6;
    } else if (index >= 56 && index <= 63) {
      return 7;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CHESS GAME',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Vez de: ' + (whiteTurn ? 'brancos' : 'pretos'),
                    style: TextStyle(
                        color: whiteTurn ? Colors.white : Colors.black,
                        fontSize: 18),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.track_changes,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        descelecionarTudo();
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.restore_page,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        resetGame();
                      }),
                ],
              ),
              Container(
                height: 40,
                child: ListView.builder(
                    itemCount: pecasBrancasMortas.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('lib/images/' +
                            pecasBrancasMortas[index][1] +
                            pecasBrancasMortas[index][0] +
                            '.png'),
                      );
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 64,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: linhas),
                  itemBuilder: (context, index) {
                    if (index == pecas[index][0]) {
                      return Container(
                        color: quadradosPretos.contains(index)
                            ? Colors.lightBlue
                            : Colors.white,
                        child: Stack(
                          children: [
                            // Text(
                            //   index.toString(),
                            //   style: TextStyle(
                            //       color: Colors.black.withOpacity(0.6),
                            //       fontSize: 12),
                            // ),
                            Piece(
                              peca: pecas[index][1],
                              cor: pecas[index][2],
                              estaPecaSelecionada: pecas[index][3],
                              killMove: pecas[index][4],
                              onTap: () {
                                pecaSelecionada(index);
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        color: quadradosPretos.contains(index)
                            ? Colors.lightBlue
                            : Colors.white,
                      );
                    }
                  },
                ),
              ),
              Container(
                height: 40,
                child: ListView.builder(
                    itemCount: pecasPretasMortas.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('lib/images/' +
                            pecasPretasMortas[index][1] +
                            pecasPretasMortas[index][0] +
                            '.png'),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
