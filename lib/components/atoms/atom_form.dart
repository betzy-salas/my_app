import 'package:flutter/material.dart';

class FormAtom extends StatelessWidget {
  final keyForm;
  final child;

  const FormAtom({Key key, this.keyForm, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Form(
        key: this.keyForm,
        child: this.child,
      );
}
