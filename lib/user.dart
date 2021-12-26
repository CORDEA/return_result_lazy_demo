import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.following}) : super(key: key);

  final bool following;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late bool following;

  @override
  void initState() {
    super.initState();
    following = widget.following;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              following = !widget.following;
            });
          },
          child: const Text('Follow'),
        ),
      ),
    );
  }
}
