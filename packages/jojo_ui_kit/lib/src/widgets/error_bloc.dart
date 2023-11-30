import 'package:flutter/material.dart';

class ErrorBlock extends StatelessWidget {
  const ErrorBlock({super.key, this.error});

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error ?? '',
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
