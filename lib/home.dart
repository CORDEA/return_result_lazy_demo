import 'package:flutter/material.dart';

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
                  builder: (context) => const UserPage(following: true),
                ),
              );
              print(result);
            },
            child: const Text('Open'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}
