import 'package:flutter/material.dart';
import 'package:flutter_cookbook/Hooks/example.dart';
import './ExamplePresenter/examplePresenter.dart';
import './Inherited Model Recipes/Contrived/view.dart';
import './Inherited Model Recipes/Contrived/model.dart';
import './Provider/Contrived/example.dart';
import './ExamplePresenter/homePage.dart';

class ExampleApp extends StatelessWidget {
  static final keyToTheNavigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget Function(BuildContext)> routes = {
      '/': (BuildContext context) => HomePage(),
      '/inheritedWidget': (BuildContext context) =>
          Brain(child: ContrivedInheritedModelExample()),
      '/provider': (BuildContext context) => ContrivedProviderExample(),
      '/hooks': (BuildContext context) => ContrivedHooksExample(),
    };

    return MaterialApp(
        navigatorKey: keyToTheNavigator,
        title: 'State Management Cookbook',
        theme: ThemeData(primarySwatch: Colors.blue, buttonColor: Colors.blue),
        routes: ExamplePresenter.exemplifyApp(routes: routes));
  }
}

void main() => runApp(ExampleApp());
