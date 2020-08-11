class Memory {
  String _value = '0';
  double resultado;

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;

  String get value {
    return _value;
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      _allClear();
    } else
      _value += command;

    var numero = int.parse(command);
  }

  void _allClear() {
    _value = '0';
  }
}
