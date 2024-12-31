import 'package:anamnesis_app/blocs/anamnesis_bloc.dart';
import 'package:anamnesis_app/blocs/anamnesis_event.dart';
import 'package:anamnesis_app/blocs/anamnesis_state.dart';
import 'package:anamnesis_app/screens/anamnesis_step2.dart';
import 'package:anamnesis_app/widgets/form_button.dart';
import 'package:anamnesis_app/widgets/form_group.dart';
import 'package:anamnesis_app/widgets/form_label.dart';
import 'package:anamnesis_app/widgets/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnamnesisStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnamnesisBloc(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF03050B),
            title: Center(
                child: Text(
              'Bienvenido a tu nuevo comienzo',
              style: Theme.of(context).textTheme.displayLarge,
            ))),
        body: BlocListener<AnamnesisBloc, AnamnesisState>(
          listener: (context, state) {
            if (state is AnamnesisStep2State) {
              // Navega a la siguiente pantalla (Step 2)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnamnesisStep2()),
              );
            }
          },
          child: AnamnesisForm(),
        ),
      ),
    );
  }
}

class AnamnesisForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

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
                      '¿Ha tenido operaciones? ¿Cuáles y hace cuánto tiempo?'),
              formWidget: FormTextField(
                  hintText: 'Escriba aquí',
                  onChanged: (value) {
                    context.read<AnamnesisBloc>().add(UpdateField1(value));
                  })),
          FormGroup(
              labelWidget: FormLabel(
                isRequired: true,
                title:
                    '¿Tiene o tuvo alguna enfermedad diagnosticada o tratada por un médico?',
              ),
              formWidget: FormTextField(
                  hintText: 'Escriba aquí',
                  onChanged: (value) {
                    context.read<AnamnesisBloc>().add(UpdateField2(value));
                  })),
          const Spacer(),
          BlocBuilder<AnamnesisBloc, AnamnesisState>(
            builder: (context, state) {
              return FormButton(
                onPressed: state.isStep1ButtonEnabled
                    ? () {
                        context.read<AnamnesisBloc>().add(SubmitStep1());
                        // Navega a la siguiente pantalla
                      }
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
