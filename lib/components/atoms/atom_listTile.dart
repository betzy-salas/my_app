import 'package:flutter/material.dart';

class ListTileAtom extends StatelessWidget {
  final leading;
  final title;
  final subtitle;
  final trailing;

  const ListTileAtom(
      {Key key, this.leading, this.title, this.subtitle, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new ListTile(
        leading: this.leading,
        title: this.title,
        subtitle: this.subtitle,
        trailing: this.trailing,
      );
}
