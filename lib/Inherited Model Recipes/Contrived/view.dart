import 'package:flutter/material.dart';
import './model.dart';

class ContrivedInheritedModelExample extends StatelessWidget {
  ContrivedInheritedModelExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[HelloTalker(), WorldTalker()]),
    );
  }
}

class HelloTalker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Top Label rebuilding...");
    final talker =
        InheritedModel.inheritFrom<Mouth>(context, aspect: 'probablyHello');
    return Text('${talker.probablyHello}');
  }
}

class WorldTalker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Bottom Label rebuilding...");
    final talker =
        InheritedModel.inheritFrom<Mouth>(context, aspect: 'probablyWorld');
    return Text('${talker.probablyWorld}');
  }
}
