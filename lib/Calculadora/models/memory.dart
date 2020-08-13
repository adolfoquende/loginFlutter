class Memory {

  String _value = '0';
  String _operation;
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  static const operations = const ['%', '/', 'X', '-', '+', '=']; //Sera usada para validar as operacoes inseridas pelo usauraioo
  bool _wipeValue = false; //Servira para limpar os dados sempre que inserir uma operacao
  double resultado;

  String get value {
    return _value;
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      //if(newOperation =='AC'){
        _buffer[0] = 0.0;
        _buffer[1] = 0.0;
        _bufferIndex=0;

      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  void _allClear() {
    _value = '0';
  }

  _setOperation(String newOperation) {

      if (_bufferIndex == 0) {
        //Verifica qual dos valores esta sendo trabalhado;
        _operation = newOperation;
        _bufferIndex = 1;
      } else {
        _operation = newOperation;

        _buffer[0] = _calculate();
        _buffer[1] = 0.0;
        _value = _buffer[0].toString(); //Para apresentar na Tela;

        print(_value);
        // _buffer[0] =0.0;


    }

    _wipeValue = true; //Verifica se foi acionado uma operacoa
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue; //Garante que a calculadora na comece com zero e que nao foi adicionado uma virgula
    if (isDot && _value.contains('.') && !wipeValue)
      return; // Verifica se ja foi adicionado um ponto para nao adicionar outro ponto

    final emptyValue = isDot ? '0' : ''; //Verifica se depois da operacao foi adicionado um ponto para assim por 0.0
    final currentValue = wipeValue ? '' : _value; //Caso tenha sido adicionada um a operacao adiciona campo vazio
    _value = currentValue + digit;
    _wipeValue = false; //Para zera os dados depois de adicionar uma operacao
    // _value += digit;
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0; //Caso nao consigar fazer um parse coloca 0
    print(_buffer[_bufferIndex]);
  }

  _calculate() {
    print(_operation+' Ola');
    switch (_operation) {
      case 'AC':
        {
          _buffer[0] = 0.0;
          _buffer[1] = 0.0;
          _bufferIndex=0;
          return;
        }
      case '%':
        return _buffer[0] % _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case 'X':
        return _buffer[0] * _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case '=':
        return _buffer[0];
      default:
        return _buffer[0];
    }
  }
}
