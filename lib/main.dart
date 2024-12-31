import 'package:anamnesis_app/blocs/anamnesis_bloc.dart';
import 'package:anamnesis_app/screens/anamnesis_step1.dart';
import 'package:anamnesis_app/theme/anamnesis_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba Técnica Anamnesis',
      theme: anamnesisTheme,
      home: BlocProvider(
        create: (context) => AnamnesisBloc(), // Proveemos el BLoC a la app
        child: AnamnesisStep1(), // Inicialmente mostramos la pantalla 1
      ),
    );
  }
}
