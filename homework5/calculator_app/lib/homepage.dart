import 'package:flutter/material.dart';

class CalculatorAppHomePage extends StatefulWidget {
  const CalculatorAppHomePage({super.key});

  @override
  State<CalculatorAppHomePage> createState() => _CalculatorAppHomePageState();
}

class _CalculatorAppHomePageState extends State<CalculatorAppHomePage> {
  String _display = '';
  String _operator = '';
  double _firstNumber = 0;
  double _secondNumber = 0;

  void _onNumberPress(String number) {
    setState(() {
      _display += number;
    });
  }

  void _onOperatorPress(String operator) {
    setState(() {
      _firstNumber = double.tryParse(_display) ?? 0;
      _display = '';
      _operator = operator;
    });
  }

  void _onCalculate() {
    setState(() {
      _secondNumber = double.tryParse(_display) ?? 0;
      double result;
      switch (_operator) {
        case '+':
          result = _firstNumber + _secondNumber;
          break;
        case '-':
          result = _firstNumber - _secondNumber;
          break;
        case '*':
          result = _firstNumber * _secondNumber;
          break;
        case '/':
          result = _firstNumber / _secondNumber;
          break;
        default:
          result = 0;
      }
      _display = result.toString();
    });
  }

  void _onClear() {
    setState(() {
      _display = '';
      _firstNumber = 0;
      _secondNumber = 0;
      _operator = '';
    });
  }

  Widget _buildButton(String text, {Color color = Colors.grey}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: color,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            if (text == '+' || text == '-' || text == '*' || text == '/') {
              _onOperatorPress(text);
            } else if (text == '=') {
              _onCalculate();
            } else if (text == 'C') {
              _onClear();
            } else {
              _onNumberPress(text);
            }
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _display,
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('/', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('*', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('C', color: Colors.red),
                  _buildButton('0'),
                  _buildButton('='),
                  _buildButton('+', color: Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
