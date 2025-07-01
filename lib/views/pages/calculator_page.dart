import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Windows Style Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(background: Colors.grey[300]!),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 18)),
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = '';
  String result = '';

  final List<String> buttons = [
    '7',
    '8',
    '9',
    '÷',
    '4',
    '5',
    '6',
    '×',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '=',
    '+',
  ];

  @override
  void initState() {
    super.initState();
    RawKeyboard.instance.addListener(_handleKey);
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKey);
    super.dispose();
  }

  void _handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent && !event.repeat) {
      final key = event.logicalKey;
      if (key == LogicalKeyboardKey.enter) {
        onButtonClick('=');
      } else if (key == LogicalKeyboardKey.escape) {
        onButtonClick('C');
      } else {
        final label = key.keyLabel;
        if (buttons.contains(label)) {
          onButtonClick(label);
        }
      }
    }
  }

  void onButtonClick(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '';
      } else if (value == '=') {
        try {
          final expression = input.replaceAll('×', '*').replaceAll('÷', '/');
          result = _evaluate(expression).toString();
        } catch (e) {
          result = 'Error';
        }
      } else {
        input += value;
      }
    });
  }

  double _evaluate(String expr) {
    final tokens = _tokenize(expr);
    final values = <double>[];
    final ops = <String>[];

    for (final token in tokens) {
      if (_isOperator(token)) {
        while (ops.isNotEmpty && _precedence(ops.last) >= _precedence(token)) {
          final b = values.removeLast();
          final a = values.removeLast();
          final op = ops.removeLast();
          values.add(_applyOp(a, b, op));
        }
        ops.add(token);
      } else {
        values.add(double.parse(token));
      }
    }

    while (ops.isNotEmpty) {
      final b = values.removeLast();
      final a = values.removeLast();
      final op = ops.removeLast();
      values.add(_applyOp(a, b, op));
    }

    return values.first;
  }

  List<String> _tokenize(String expr) {
    final tokens = <String>[];
    var number = '';
    for (var char in expr.split('')) {
      if ('0123456789.'.contains(char)) {
        number += char;
      } else {
        if (number.isNotEmpty) {
          tokens.add(number);
          number = '';
        }
        tokens.add(char);
      }
    }
    if (number.isNotEmpty) tokens.add(number);
    return tokens;
  }

  bool _isOperator(String ch) => ['+', '-', '*', '/'].contains(ch);

  int _precedence(String op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    return 0;
  }

  double _applyOp(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return a / b;
      default:
        throw Exception('Unknown operator $op');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(blurRadius: 8, color: Colors.black26),
              ],
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 12,
                  ),
                  child: Text(input, style: const TextStyle(fontSize: 28)),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.1,
                        ),
                    itemBuilder: (context, index) {
                      final b = buttons[index];
                      Color bg = Colors.grey.shade300;
                      if ('÷×-+'.contains(b)) bg = Colors.orange.shade400;
                      if (b == '=') bg = Colors.green;
                      if (b == 'C') bg = Colors.red.shade400;

                      return Material(
                        color: bg,
                        borderRadius: BorderRadius.circular(6),
                        child: InkWell(
                          onTap: () => onButtonClick(b),
                          borderRadius: BorderRadius.circular(6),
                          child: Center(
                            child: Text(
                              b,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
