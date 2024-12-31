import 'package:flutter/material.dart';

// A custom text field widget that provides input functionality with a styled border.
class FormTextField extends StatelessWidget {
  // Constructor to accept hintText and onChanged callback.
  const FormTextField({super.key, this.hintText = '', required this.onChanged});

  // Hint text to display inside the text field when it is empty.
  final String hintText;

  // Callback function that gets called when the text in the field changes.
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    // Defines the border style for the input field when it's in its normal or focused state.
    OutlineInputBorder inputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: Color(0xFF343642),
        width: 2.0,
      ),
    );

    return SizedBox(
        height: 53,
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText == '' ? 'Escribe aquí' : hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
          ),
        ));
  }
}
