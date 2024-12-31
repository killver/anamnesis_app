import 'package:flutter/material.dart';

// A custom widget that represents a button with switchable active/inactive states.
class FormSwitchButton extends StatelessWidget {
  // Constructor to accept necessary parameters: onPressed, isActive, and title.
  const FormSwitchButton(
      {super.key,
      required this.onPressed,
      required this.isActive,
      required this.title});

  // Callback function when the button is pressed.
  final Function() onPressed;

  // Flag to indicate if the button is active (true) or inactive (false).
  final bool isActive;

  // The text to be displayed on the button.
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: isActive
              ? const Color(0xFF038BED) // Active button border color
              : const Color(0xFF343642), // Inactive button border color
        ),
        backgroundColor: Colors.transparent, // Transparent background
      ),
      child: Text(
        title,
        style: isActive
            ? Theme.of(context).textTheme.labelLarge
            : Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
