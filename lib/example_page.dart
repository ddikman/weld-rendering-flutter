import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  final String contents;

  const ExamplePage({Key? key, required this.contents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(contents, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}