import 'package:flutter/material.dart';
import 'package:beautiful_ui/stateless/ChatMessage.dart';
import 'package:beautiful_ui/stateful/ChatScreen.dart';

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _chatMessages = <ChatMessage>[];
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    var messageList = new Flexible(
        child: new ListView.builder(
          padding: const EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _chatMessages[index],
          itemCount: _chatMessages.length,
        )
    );

    var inputMessage = new Container(
        decoration: new BoxDecoration(
            color: Theme
                .of(context)
                .cardColor
        ),
        child: _buildTextComposer()
    );

    return new Scaffold(
        appBar: new AppBar(
            title: new Text("MoneyChatter")
        ),
        body: new Column(
          children: <Widget>[
            messageList,
            new Divider(height: 1.0),
            inputMessage
          ],
        )
    );
  }

  Widget _buildTextComposer() {
    var flexibleMessageField = new Flexible(
      child: new TextField(
        controller: _textController,
        onChanged: (String text) {
          setState(() {
            _isComposing = text.length > 0;
          });
        },
        onSubmitted: _handleSubmit,
        decoration: new InputDecoration.collapsed(
            hintText: "Send A Message"
        ),
      ),
    );

    var sendIcon = new Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 4.0, vertical: 5.0),
        child: new IconButton(
          icon: new Icon(Icons.send),
          onPressed: _isComposing
              ? () => _handleSubmit(_textController.text)
              : null,
        )
    );

    return new IconTheme(
      data: new IconThemeData(color: Theme
          .of(context)
          .accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            flexibleMessageField,
            sendIcon
          ],
        ),
      ),
    );
  }

  void _handleSubmit(String value) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: value,
      animationController: new AnimationController(
          duration: new Duration(milliseconds: 200),
          vsync: this
      ),
    );
    setState(() {
      _chatMessages.insert(0, message);
      _isComposing = false;
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _chatMessages) {
      message.animationController.dispose();
    }
  }

}


