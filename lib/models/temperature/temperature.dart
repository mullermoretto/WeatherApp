

class Temperature {
  final double _value;

  Temperature({
    required double value
  }):_value = value;

  String format() {
    return _value.toStringAsFixed(0);
  }

  double get value => _value;

}