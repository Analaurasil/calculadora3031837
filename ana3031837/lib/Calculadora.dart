import 'package:flutter/material.dart';
import 'Calculo.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}


class _CalculadoraState extends State<Calculadora> {
  Calculo calculo = Calculo();
  String _displayText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(118, 205, 222, 1),
            width: 8.0,
          ),
        ),
         child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(200, 232, 226, 1),
                image: DecorationImage(
                  image: AssetImage('assets/images/image.jpg'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Expanded(
              child: _areaExibicao(),
            ),
            _teclado(),
          ],
        ),
      ),
    );
  }

  Widget _areaExibicao() {
    return Expanded(
      child: Container(
        color: Color.fromRGBO(200, 232, 226, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  Color.fromRGBO(92, 40, 2, 1),
                    width: 6.0,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                  color: Color.fromRGBO(195, 210, 215, 1), 
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(68, 125, 136, 1),
                      width: 6.0,
                    ),
                    borderRadius: BorderRadius.circular(0),
                    color: Color.fromARGB(255, 197, 214, 240),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), 
                      child: Text(
                        _displayText,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                           fontFamily: 'KodeMono',
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(113, 112, 116, 1)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }


  Widget _botao(double size, String text, IconData? icon) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 219, 159, 1),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color.fromRGBO(92, 40, 2, 1),
          width: 5.0,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _processarComando(text);
          });
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  size: size * 0.6,
                  color: Color.fromRGBO(59, 98, 170, 1),
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'KodeMono',
                    fontSize: size * 0.5,
                    color: Color.fromRGBO(59, 98, 170, 1),
                    ),
                ),
        ),
      ),
    );
  }


  Widget _teclado() {
    return Container(
      color: Color.fromRGBO(200, 232, 226, 1),
      height: 500.0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double botaoSize = constraints.maxWidth / 5;
          return Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _botao(botaoSize, 'C', null),
                    _botao(botaoSize, '', Icons.arrow_back),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _botao(botaoSize, '7', null),
                    _botao(botaoSize, '8', null),
                    _botao(botaoSize, '9', null),
                    _botao(botaoSize, '/', null),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _botao(botaoSize, '4', null),
                    _botao(botaoSize, '5', null),
                    _botao(botaoSize, '6', null),
                    _botao(botaoSize, '*', null),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _botao(botaoSize, '1', null),
                    _botao(botaoSize, '2', null),
                    _botao(botaoSize, '3', null),
                    _botao(botaoSize, '-', null),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _botao(botaoSize, '0', null),
                    _botao(botaoSize, '.', null),
                    _botao(botaoSize, '=', null),
                    _botao(botaoSize, '+', null),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }


  void _processarComando(String comando) {
    calculo.aplicarComando(comando);
    _displayText = calculo.resultado;
  }
}