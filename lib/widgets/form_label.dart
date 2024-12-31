import 'package:flutter/material.dart';

// A widget that displays a label with optional asterisk indicating required fields.
class FormLabel extends StatelessWidget {
  // Constructor to accept title and optional "isRequired" parameter.
  FormLabel({super.key, required this.title, this.isRequired = false});

  // The title of the label (e.g., a description of a field).
  final String title;

  // A flag to indicate if the field is required (default is false).
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
        text: TextSpan(
          text: title,
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
              text: isRequired ? '*' : '',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
