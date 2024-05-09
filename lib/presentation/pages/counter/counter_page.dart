import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
        ),
        body: const Center(
          child: Text('0'),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {},
              heroTag: null,
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 4),
            FloatingActionButton(
              onPressed: () {},
              heroTag: null,
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
