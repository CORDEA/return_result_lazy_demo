import 'package:flutter/material.dart';

import 'material_page_result_propagation_route.dart';
import 'user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const WillPopScopeUserPage(following: true),
                ),
              );
              print(result);
            },
            child: const Text('Open'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageResultPropagationRoute<bool>(
                  builder: (context, sink) => UserPage(
                    following: true,
                    resultSink: sink,
                  ),
                ),
              );
              print(result);
            },
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}
