import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_form.dart';
import 'package:flutter_app/components/atoms/atom_listViewEmpty.dart';

class FormListViewMolecule extends StatelessWidget {
  final keyForm;
  final padding;
  final children;

  FormListViewMolecule({Key key, this.keyForm, this.padding, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormAtom(
      keyForm: this.keyForm,
      child: ListViewEmptyAtom(
        padding: this.padding,
        children: this.children,
      ),
    );
  }
}
