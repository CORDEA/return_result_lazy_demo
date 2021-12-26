import 'package:flutter/material.dart';

import 'material_page_result_propagation_route.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    Key? key,
    required this.following,
    required this.resultSink,
  }) : super(key: key);

  final bool following;
  final MaterialPageResultSink<bool> resultSink;

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
      body: _UserPageBody(
        onPressed: () {
          setState(() {
            following = !following;
          });
          widget.resultSink.emit(following);
        },
      ),
    );
  }
}

class WillPopScopeUserPage extends StatefulWidget {
  const WillPopScopeUserPage({Key? key, required this.following})
      : super(key: key);

  final bool following;

  @override
  State<WillPopScopeUserPage> createState() => _WillPopScopeUserPageState();
}

class _WillPopScopeUserPageState extends State<WillPopScopeUserPage> {
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
      body: WillPopScope(
        child: _UserPageBody(
          onPressed: () {
            setState(() {
              following = !following;
            });
          },
        ),
        onWillPop: () async {
          Navigator.pop(context, following);
          return false;
        },
      ),
    );
  }
}

class _UserPageBody extends StatelessWidget {
  const _UserPageBody({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Follow'),
      ),
    );
  }
}
