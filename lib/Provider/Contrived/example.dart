import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KnowledgeBase with ChangeNotifier {
  final String probablyHello = "Hello";
  String probablyWorld = "World";
  Timer wordChanger;

  KnowledgeBase() {
    wordChanger = Timer.periodic(Duration(seconds: 1), (Timer t) {
      this.probablyWorld = Random.secure().nextInt(99).toString();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    wordChanger.cancel();
    super.dispose();
  }
}

class ContrivedProviderExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContrivedProviderState();
  }
}

class ContrivedProviderState extends State<ContrivedProviderExample> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KnowledgeBase>(
      builder: (context) {
        return KnowledgeBase();
      },
      child: Center(
          child: Column(
        children: <Widget>[
          Selector<KnowledgeBase, String>(
            selector: (_, kb) => kb.probablyHello,
            builder: (_, value, ___) {
              print("Selector: Top label rebuilding...");
              return Text("$value");
            },
          ),
          Selector<KnowledgeBase, String>(
            selector: (_, kb) => kb.probablyWorld,
            builder: (_, value, ___) {
              print("Selector: Bottom label rebuilding...");
              return Text("$value");
            },
          ),
        ],
      )),
    );
  }
}
