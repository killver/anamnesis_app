import 'package:equatable/equatable.dart';

class AnamnesisState extends Equatable {
  // Estado para Step 1
  final String field1;
  final String field2;
  final bool isStep1ButtonEnabled;

  // Estado para Step 2
  final bool? question1; // null: no seleccionada
  final bool? question2;
  final bool isStep2ButtonEnabled;

  // New fields for button selection
  final bool isYesQuestion1Selected;
  final bool isNoQuestion1Selected;
  final bool isYesQuestion2Selected;
  final bool isNoQuestion2Selected;

  AnamnesisState({
    required this.field1,
    required this.field2,
    required this.isStep1ButtonEnabled,
    this.question1,
    this.question2,
    required this.isStep2ButtonEnabled,
    required this.isYesQuestion1Selected,
    required this.isNoQuestion1Selected,
    required this.isYesQuestion2Selected,
    required this.isNoQuestion2Selected,
  });

  // Estado inicial
  factory AnamnesisState.initial() {
    return AnamnesisState(
      field1: '',
      field2: '',
      isStep1ButtonEnabled: false,
      question1: null,
      question2: null,
      isStep2ButtonEnabled: false,
      isYesQuestion1Selected: false,
      isNoQuestion1Selected: false,
      isYesQuestion2Selected: false,
      isNoQuestion2Selected: false,
    );
  }

  // Copia para actualizar estado
  AnamnesisState copyWith({
    String? field1,
    String? field2,
    bool? isStep1ButtonEnabled,
    bool? question1,
    bool? question2,
    bool? isStep2ButtonEnabled,
    bool? isYesQuestion1Selected,
    bool? isNoQuestion1Selected,
    bool? isYesQuestion2Selected,
    bool? isNoQuestion2Selected,
  }) {
    return AnamnesisState(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      isStep1ButtonEnabled: isStep1ButtonEnabled ?? this.isStep1ButtonEnabled,
      question1: question1 ?? this.question1,
      question2: question2 ?? this.question2,
      isStep2ButtonEnabled: isStep2ButtonEnabled ?? this.isStep2ButtonEnabled,
      isYesQuestion1Selected:
          isYesQuestion1Selected ?? this.isYesQuestion1Selected,
      isNoQuestion1Selected:
          isNoQuestion1Selected ?? this.isNoQuestion1Selected,
      isYesQuestion2Selected:
          isYesQuestion2Selected ?? this.isYesQuestion2Selected,
      isNoQuestion2Selected:
          isNoQuestion2Selected ?? this.isNoQuestion2Selected,
    );
  }

  @override
  List<Object?> get props => [
        field1,
        field2,
        isStep1ButtonEnabled,
        question1,
        question2,
        isStep2ButtonEnabled,
        isYesQuestion1Selected,
        isNoQuestion1Selected,
        isYesQuestion2Selected,
        isNoQuestion2Selected,
      ];
}

// Estado para Step 2 (cuando se navega a Step 2)
class AnamnesisStep2State extends AnamnesisState {
  AnamnesisStep2State()
      : super(
          field1:
              '', // You can use default values or set them to previous values.
          field2: '', // Same here, depending on how you manage the data.
          isStep1ButtonEnabled: false, // Step 1 button is no longer relevant.
          isStep2ButtonEnabled: false, // Adjust based on the next screen.
          question1: null, // Initial state for question1.
          question2: null, // Initial state for question2.
          isYesQuestion1Selected: false, // Initial state for Yes button.
          isNoQuestion1Selected: false, // Initial state for No button.
          isYesQuestion2Selected: false, // Initial state for Yes button.
          isNoQuestion2Selected: false, // Initial state for No button.
        );

  @override
  List<Object?> get props => [];
}
