import 'dart:async';
import 'dart:math';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class ContrivedHooksExample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final word = useState("World");
    final wordChanger = useState<Timer>();

    useEffect(() {
      wordChanger.value = Timer.periodic(Duration(seconds: 1), (_) {
        word.value = Random.secure().nextInt(99).toString();
      });

      return () => wordChanger.value.cancel();
    }, []);

    return Center(child: Column(children: [Text("Hello"), Text(word.value)]));
  }
}
