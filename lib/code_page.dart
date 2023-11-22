import 'package:flutter/material.dart';

class CodePage extends StatelessWidget {
  final String title;
  final Widget child;

  const CodePage({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}
