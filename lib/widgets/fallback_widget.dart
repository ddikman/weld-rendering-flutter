import 'package:flutter/cupertino.dart';

class FallbackWidget extends StatelessWidget {
  final String title;

  const FallbackWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}