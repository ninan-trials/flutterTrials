import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String text;
  final AnimationController animationController;
  var _name = 'Leo';

  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    var avatar = new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(
            child: new Text(_name[0])
        )
    );
    var senderNameAndMessage = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(_name, style: Theme
            .of(context)
            .textTheme
            .subhead),
        new Container(
            child: new Text(text),
            margin: const EdgeInsets.only(top: 5.0)
        )
      ],
    );
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          curve: Curves.easeOut,
          parent: animationController
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            avatar,
            senderNameAndMessage
          ],
        ),
      ),
    );
  }
}