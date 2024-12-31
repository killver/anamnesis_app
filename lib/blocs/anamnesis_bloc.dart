import 'package:flutter_bloc/flutter_bloc.dart';
import 'anamnesis_event.dart';
import 'anamnesis_state.dart';

/// Bloc that manages the state of the Anamnesis form in the application.
/// It handles events related to updating form fields, answering questions,
/// and submitting each step of the form.
class AnamnesisBloc extends Bloc<AnamnesisEvent, AnamnesisState> {
  /// Constructor initializes the bloc with an initial state.
  AnamnesisBloc() : super(AnamnesisState.initial()) {
    // **Step 1: Handling Form Fields**
    // Handles updates for the first field in Step 1 of the form.
    // Enables or disables the Step 1 submit button based on whether both fields are filled.
    on<UpdateField1>((event, emit) {
      emit(state.copyWith(
        field1: event.value,
        isStep1ButtonEnabled: event.value.isNotEmpty && state.field2.isNotEmpty,
      ));
    });

    // Handles updates for the second field in Step 1.
    // Enables or disables the Step 1 submit button based on whether both fields are filled.
    on<UpdateField2>((event, emit) {
      emit(state.copyWith(
        field2: event.value,
        isStep1ButtonEnabled: state.field1.isNotEmpty && event.value.isNotEmpty,
      ));
    });

    // Submits Step 1 and navigates to Step 2 by emitting a new state.
    on<SubmitStep1>((event, emit) {
      emit(AnamnesisStep2State());
    });

    // **Step 2: Handling Questions**
    // Handles updates to the first question in Step 2 (Yes/No question).
    // Enables or disables the Step 2 submit button based on whether both questions have been answered.
    on<UpdateQuestion1>((event, emit) {
      emit(state.copyWith(
        question1: event.value,
        isStep2ButtonEnabled: event.value != null && state.question2 != null,
      ));
    });

    // Handles updates to the second question in Step 2 (Yes/No question).
    // Enables or disables the Step 2 submit button based on whether both questions have been answered.
    on<UpdateQuestion2>((event, emit) {
      emit(state.copyWith(
        question2: event.value,
        isStep2ButtonEnabled: state.question1 != null && event.value != null,
      ));
    });

    // Submits Step 2, typically triggering a confirmation or sending the data.
    on<SubmitStep2>((event, emit) {
      // Logic for confirmation or sending data can be added here.
    });

    // **Handling Yes/No Questions (for both questions)**
    // Update state when the user selects "Yes" for question1.
    on<UpdateYesQuestion1>((event, emit) {
      emit(state.copyWith(
        isYesQuestion1Selected: true,
        isNoQuestion1Selected: false,
      ));
    });

    // Update state when the user selects "No" for question1.
    on<UpdateNoQuestion1>((event, emit) {
      emit(state.copyWith(
        isYesQuestion1Selected: false,
        isNoQuestion1Selected: true,
      ));
    });

    // Update state when the user selects "Yes" for question2.
    on<UpdateYesQuestion2>((event, emit) {
      emit(state.copyWith(
        isYesQuestion2Selected: true,
        isNoQuestion2Selected: false,
      ));
    });

    // Update state when the user selects "No" for question2.
    on<UpdateNoQuestion2>((event, emit) {
      emit(state.copyWith(
        isYesQuestion2Selected: false,
        isNoQuestion2Selected: true,
      ));
    });
  }
}
