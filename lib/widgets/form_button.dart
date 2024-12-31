import 'package:flutter/material.dart';

/// This widget simplifies button creation by ensuring consistent
/// design and allowing customization of text and actions.
class FormButton extends StatelessWidget {
  /// - [onPressed]: The function to execute when the button is pressed.
  ///   If `null`, the button is disabled.
  /// - [title]: The text displayed on the button. Defaults to `'Siguiente'`
  ///   if not provided.
  const FormButton({super.key, this.onPressed, this.title = ''});

  /// Callback function triggered when the button is pressed.
  /// If `null`, the button will be disabled.
  final Function()? onPressed;

  // The text displayed on the button.
  /// Defaults to `'Siguiente'` if no title is provided.
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: onPressed,
      child: Text(title == '' ? 'Siguiente' : title),
    );
  }
}
