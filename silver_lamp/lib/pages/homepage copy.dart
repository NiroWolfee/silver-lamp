import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gait_analysis/responsive/desktop_body.dart';
import 'package:gait_analysis/responsive/mobile_body.dart';
import 'package:gait_analysis/responsive/responsive_layout.dart';
import 'package:gait_analysis/util/cards.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colors = [
    Colors.deepPurple,
    Colors.green,
    Colors.red,
  ];

  final user = FirebaseAuth.instance.currentUser!;

  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('signed in as: ' + user.email!),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  color: Colors.deepPurple[200],
                  child: Text('sign out'),
                ),
              ],
            ),
            Container(
              height: 300,
              width: 200,
              child: SwipableStack(
                detectableSwipeDirections: const {
                  SwipeDirection.right,
                  SwipeDirection.left,
                },
                controller: _controller,
                stackClipBehaviour: Clip.none,
                onSwipeCompleted: (index, direction) {
                  if (kDebugMode) {
                    print('$index, $direction');
                  }
                },
                horizontalSwipeThreshold: 0.8,
                verticalSwipeThreshold: 0.8,
                builder: (context, properties) {
                  final itemIndex = properties.index % colors.length;
                  return Stack(
                    children: [SwipeCard(color: colors[itemIndex])],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
