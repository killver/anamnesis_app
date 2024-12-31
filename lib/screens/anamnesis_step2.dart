import 'package:anamnesis_app/blocs/anamnesis_bloc.dart';
import 'package:anamnesis_app/blocs/anamnesis_event.dart';
import 'package:anamnesis_app/blocs/anamnesis_state.dart';
import 'package:anamnesis_app/widgets/form_button.dart';
import 'package:anamnesis_app/widgets/form_group.dart';
import 'package:anamnesis_app/widgets/form_label.dart';
import 'package:anamnesis_app/widgets/form_switch_button.dart';
import 'package:anamnesis_app/widgets/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Main screen for Step 2 of the anamnesis process
class AnamnesisStep2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the AnamnesisBloc to this screen for managing state
      create: (_) => AnamnesisBloc(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF03050B),
            title: Center(
                child: Text(
              'Bienvenido a tu nuevo comienzo',
              style: Theme.of(context).textTheme.displayLarge,
            ))),
        body: AnamnesisQuestionsForm(),
      ),
    );
  }
}

// Widget containing the anamnesis questions form
class AnamnesisQuestionsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('Completa la sigiente información',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineMedium)),
          Text(
            'Todos los campos son obligatorios',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          FormGroup(
            labelWidget: FormLabel(
                isRequired: true,
                title:
                    '¿Tiene dolores frecuentes y no ha consultado al médico?'),
            formWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: FormSwitchButton(
                        onPressed: () {
                          context
                              .read<AnamnesisBloc>()
                              .add(UpdateYesQuestion1());
                          context
                              .read<AnamnesisBloc>()
                              .add(UpdateQuestion1(true));
                        },
                        isActive: context
                            .watch<AnamnesisBloc>()
                            .state
                            .isYesQuestion1Selected,
                        title: 'Sí')),
                Expanded(
                    child: FormSwitchButton(
                        onPressed: () {
                          context
                              .read<AnamnesisBloc>()
                              .add(UpdateNoQuestion1());
                          context
                              .read<AnamnesisBloc>()
                              .add(UpdateQuestion1(false));
                        },
                        isActive: context
                            .watch<AnamnesisBloc>()
                            .state
                            .isNoQuestion1Selected,
                        title: 'No')),
              ],
            ),
          ),
          FormGroup(
              labelWidget: FormLabel(
                isRequired: true,
                title:
                    '¿Le ha dicho el médico que tiene algún problema en los huesos o en las articulaciones, que pueda desfavorecer con el ejercicio?',
              ),
              formWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: FormSwitchButton(
                          onPressed: () {
                            context
                                .read<AnamnesisBloc>()
                                .add(UpdateYesQuestion2());
                            context
                                .read<AnamnesisBloc>()
                                .add(UpdateQuestion2(true));
                          },
                          isActive: context
                              .watch<AnamnesisBloc>()
                              .state
                              .isYesQuestion2Selected,
                          title: 'Sí')),
                  Expanded(
                      child: FormSwitchButton(
                          onPressed: () {
                            context
                                .read<AnamnesisBloc>()
                                .add(UpdateNoQuestion2());
                            context
                                .read<AnamnesisBloc>()
                                .add(UpdateQuestion2(false));
                          },
                          isActive: context
                              .watch<AnamnesisBloc>()
                              .state
                              .isNoQuestion2Selected,
                          title: 'No')),
                ],
              )),
          const Spacer(),
          BlocBuilder<AnamnesisBloc, AnamnesisState>(
            builder: (context, state) {
              return FormButton(
                onPressed: state.isStep2ButtonEnabled
                    ? () {
                        context.read<AnamnesisBloc>().add(SubmitStep2());
                        _showConfirmationDialog(context);
                      }
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: Text(
              'Gracias por completar el formulario para la Anamnesis App.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
