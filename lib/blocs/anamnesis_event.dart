import 'package:equatable/equatable.dart';

abstract class AnamnesisEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Eventos para Step 1
class UpdateField1 extends AnamnesisEvent {
  final String value;

  UpdateField1(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateField2 extends AnamnesisEvent {
  final String value;

  UpdateField2(this.value);

  @override
  List<Object> get props => [value];
}

class SubmitStep1 extends AnamnesisEvent {}

// Eventos para Step 2
class UpdateQuestion1 extends AnamnesisEvent {
  final bool value;

  UpdateQuestion1(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateQuestion2 extends AnamnesisEvent {
  final bool value;

  UpdateQuestion2(this.value);

  @override
  List<Object> get props => [value];
}

// Add events to handle button selection
class UpdateYesQuestion1 extends AnamnesisEvent {}

class UpdateNoQuestion1 extends AnamnesisEvent {}

class UpdateYesQuestion2 extends AnamnesisEvent {}

class UpdateNoQuestion2 extends AnamnesisEvent {}

class SubmitStep2 extends AnamnesisEvent {}
