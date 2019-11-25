import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:async';

class Brain extends StatefulWidget {
  final Widget child;

  Brain({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BrainState();
  }
}

class BrainState extends State<Brain> {
  Timer scheduledUpdates;
  String doledProbablyWorld = 'World';
  @override
  void dispose() {
    scheduledUpdates.cancel();
    super.dispose();
  }

  @override
  void initState() {
    scheduledUpdates = Timer.periodic(Duration(seconds: 1), (Timer t) {
      final String someNumber = "${Random.secure().nextInt(99)}";

      setState(() {
        doledProbablyWorld = someNumber;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mouth(
      child: widget.child,
      probablyHello: "Hello",
      probablyWorld: doledProbablyWorld,
    );
  }
}

class Mouth extends InheritedModel<String> {
  final String probablyHello;
  final String probablyWorld;

  const Mouth({this.probablyHello, this.probablyWorld, Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(Mouth oldWidget) {
    return oldWidget.probablyWorld != probablyWorld ||
        oldWidget.probablyHello != probablyHello;
  }

  @override
  bool updateShouldNotifyDependent(Mouth oldWidget, Set<String> dependencies) {
    return (dependencies.contains('probablyHello') &&
            oldWidget.probablyHello != probablyHello) ||
        (dependencies.contains('probablyWorld') &&
            oldWidget.probablyWorld != probablyWorld);
  }
}
