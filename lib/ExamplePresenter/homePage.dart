import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Text("👋 Flutter is Awesome!",
            style: Theme.of(context).textTheme.headline),
        SizedBox(height: 5),
        Text(
            "This is all about state management and architecture in Flutter. Tap between examples at the bottom of the screen.",
            style: Theme.of(context).textTheme.subhead),
      ],
    );
  }
}
