import 'package:flutter/material.dart';
import 'package:flutter_app/components/organisms/organism_form_listView.dart';

class FormListViewTemplate extends StatelessWidget {
  FormListViewTemplate({
    Key key,
    this.keyForm,
    this.padding,
    this.children,
  }) : super(key: key);

  final keyForm;
  final padding;
  final children;

  @override
  Widget build(BuildContext context) {
    return FormListViewOrganism(
      keyForm: this.keyForm,
      padding: this.padding,
      children: this.children,
    );
  }
}
