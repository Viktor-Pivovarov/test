import 'package:flutter/material.dart';

class CounterOf extends StatelessWidget {
  const CounterOf({
    required this.current,
    required this.all,
    super.key,
  });

  final num current;
  final num all;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: current.toString(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 28,
            ),
          ),
          TextSpan(
            text: '/$all',
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
