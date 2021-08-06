import 'package:flutter/material.dart';
import 'package:flutter_app/components/molecules/molecule_formListView.dart';

class FormListViewOrganism extends StatelessWidget {
  final keyForm;
  final padding;
  final children;

  FormListViewOrganism({Key key, this.keyForm, this.padding, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormListViewMolecule(
      keyForm: this.keyForm,
      padding: this.padding,
      children: this.children,
    );
  }
}
