class Calculo {
  static const operacoes = ['/', '+', '-', '*', '='];
  String _op = '';
  bool _opUsada = false;
  final List<double> _memoria = [0.0, 0.0];
  int _inicio = 0;
  String resultado = '0';


  Calculo() {
    _limpar();
  }


  void _limpar() {
    resultado = '0';
    _memoria.setAll(0, [0.0, 0.0]);
    _inicio = 0;
    _op = '';
    _opUsada = false;
  }


  void aplicarComando(String comando) {
    if (comando == 'C') {
      _limpar();
    } else if (comando == '') {
      deletarDigito();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _addDigito(comando);
    }
  }


  void deletarDigito() {
    resultado = resultado.length > 1 ? resultado.substring(0, resultado.length - 1) : '0';
  }


  void _addDigito(String digito) {
    if (_opUsada) resultado = '0';


    if (resultado.contains('.') && digito == '.') digito = '';
    if (resultado == '0' && digito != '.') {
      resultado = digito;
    } else {
      resultado += digito;
    }


    _memoria[_inicio] = double.tryParse(resultado) ?? 0.0;
    _opUsada = false;
  }


  void _setOperacao(String op) {
    if (_opUsada && op == _op) return;


    if (_inicio == 0) {
      _inicio = 1;
    } else {
      _memoria[0] = _calcular();
      _memoria[1] = 0.0; // Reinicia o segundo operando
    }


    if (op != '=') {
      _op = op;
    }


    resultado = _memoria[0].toString();
    resultado = resultado.endsWith('.0') ? resultado.split('.')[0] : resultado;


    _opUsada = true;
  }


  double _calcular() {
    switch (_op) {
      case '/':
        return _memoria[0] / _memoria[1];
      case '*':
        return _memoria[0] * _memoria[1];
      case '+':
        return _memoria[0] + _memoria[1];
      case '-':
        return _memoria[0] - _memoria[1];
      default:
        return 0.0;
    }
  }
}


