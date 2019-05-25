import 'package:flutter/material.dart';
import 'package:beautiful_ui/stateful/ChatScreen.dart';

void main() {
  runApp(new MoneyChat());
}

class MoneyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.dark(),
      home: new ChatScreen(),
    );
  }
}



