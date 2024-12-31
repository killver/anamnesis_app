import 'package:flutter/material.dart';

// A reusable widget to group a label and a form field (e.g., a text input or button).
class FormGroup extends StatelessWidget {
  FormGroup({super.key, required this.labelWidget, required this.formWidget});

  // The widget for the label (e.g., a text widget).
  final Widget labelWidget;

  // The widget for the form element (e.g., TextField, Button).
  final Widget formWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 10), child: labelWidget),
            formWidget,
          ],
        ));
  }
}
