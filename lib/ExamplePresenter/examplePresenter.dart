import 'package:flutter/material.dart';
import '../main.dart';

typedef Routes = Map<String, Widget Function(BuildContext)> Function(
    {Map<String, Widget Function(BuildContext)> routes});

class ExamplePresenter extends StatelessWidget {
  final String exampleName;
  final Widget exampleToPresent, bottomNavigation;

  ExamplePresenter(
      {this.exampleName, this.exampleToPresent, this.bottomNavigation})
      : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exampleName),
        leading: Container(),
      ),
      body: exampleToPresent,
      bottomNavigationBar: bottomNavigation,
    );
  }

  static Map<String, Widget Function(BuildContext)> exemplifyApp(
      {Map<String, Widget Function(BuildContext)> routes}) {
    final buttons = routes
        .map((routeName, _) => MapEntry(
            routeName,
            Container(
                margin: EdgeInsets.all(8),
                child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    padding: EdgeInsets.all(6),
                    onPressed: () {
                      ExampleApp.keyToTheNavigator.currentState
                          .pushReplacementNamed(routeName);
                    },
                    child: Text("$routeName")))))
        .values
        .toList();

    final picker = Hero(
      child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: buttons,
            scrollDirection: Axis.horizontal,
          ),
          height: 66),
      tag: "there goes my hero!",
    );

    return routes.map((routeName, widgetBuilder) => MapEntry(
        routeName,
        (BuildContext context) => ExamplePresenter(
              bottomNavigation: picker,
              exampleToPresent: widgetBuilder(context),
              exampleName: routeName,
            )));
  }
}
