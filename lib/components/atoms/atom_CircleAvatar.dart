import 'package:flutter/material.dart';

class CircleAvatarAtom extends StatelessWidget {
  final backgroundColor;
  final child;

  const CircleAvatarAtom({Key key, this.backgroundColor, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new CircleAvatar(
      backgroundColor: this.backgroundColor, child: this.child);
}
