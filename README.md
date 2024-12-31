# Anamnesis App

Anamnesis App es una aplicación Flutter que permite a los usuarios completar un formulario de anamnesis (historia médica) en varias etapas. La aplicación usa el patrón **BLoC (Business Logic Component)** para gestionar el estado de la interfaz de usuario y los datos.

## Instrucciones para ejecutar la aplicación

### Requisitos previos

Para ejecutar esta aplicación, asegúrate de tener instalados los siguientes programas:

- **Flutter**: versión 3.4.4 o superior.
- **Dart SDK**: versión 3.4.4 o superior.
- **Editor de código** (como Visual Studio Code o Android Studio).

### Pasos para ejecutar

1. Clona el repositorio:
   ```bash
   git clone https://github.com/killver/anamnesis_app.git
   ```
2. Accede al directorio del proyecto:
   ```bash
   cd anamnesis_app
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

### Versiones

- **Flutter**: `>=3.4.4 <4.0.0`
- **Dart SDK**: `>=3.4.4 <4.0.0`
- **Dependencias**:
  - `flutter_bloc: ^8.1.6`
  - `equatable: ^2.0.7`

---

## Gestión de Estado

### Elección del Patrón: BLoC

En esta aplicación se utiliza el patrón **BLoC (Business Logic Component)** para la gestión del estado. BLoC es un patrón arquitectónico popular en aplicaciones Flutter que se enfoca en separar la lógica de negocio de la interfaz de usuario.

#### ¿Por qué BLoC?

- **Escalabilidad**: BLoC permite manejar fácilmente la lógica compleja de la aplicación en grandes proyectos. Separa el estado y los eventos, lo que hace que sea más fácil mantener y ampliar el código.
- **Testabilidad**: Como la lógica de negocio se encuentra separada del UI, se facilita la realización de pruebas unitarias.
- **Consistencia**: Usar BLoC asegura que todas las actualizaciones del estado se manejan de manera coherente y que la UI solo responde a cambios de estado.

### Descripción de los Componentes BLoC

- **BLoC**: Los archivos `anamnesis_bloc.dart` contienen la lógica para manejar los eventos y el estado de cada paso del formulario.
- **Estado**: El estado de la aplicación se define en el archivo `anamnesis_state.dart`, donde se almacenan las respuestas a las preguntas, los valores de los campos, y el estado de los botones (habilitados o deshabilitados).
- **Eventos**: Los eventos se definen en `anamnesis_event.dart`, y son las acciones que disparan cambios en el estado (como la actualización de los campos del formulario o el envío de un paso).

---

## Decisiones Técnicas Relevantes

### Validaciones

Las validaciones de los campos y botones se realizan en el BLoC, mediante la lógica de negocio. Por ejemplo, en Step 1, los botones solo se habilitan cuando ambos campos de texto están completos. De manera similar, en Step 2, los botones solo se habilitan cuando ambas preguntas tienen una respuesta (Sí/No).

- **Validación de campos**: Cuando el usuario introduce datos en los campos de texto, los eventos `UpdateField1` y `UpdateField2` actualizan el estado de los campos y habilitan/deshabilitan el botón de envío basado en la validez de los campos.
- **Validación de respuestas**: En las preguntas de Step 2, los botones de "Sí" y "No" solo están habilitados cuando el usuario selecciona una opción para ambas preguntas.

### Animaciones

La aplicación no usa animaciones complejas, pero se podría considerar agregar transiciones suaves entre pasos (por ejemplo, utilizando `PageRouteBuilder` o `AnimatedSwitcher` para una experiencia de usuario más fluida).

### Uso de Widgets Específicos

Se usan varios widgets personalizados para la interfaz de usuario, como:

- **FormSwitchButton**: Un widget personalizado que implementa un botón de interruptor (sí/no) para cada pregunta en el formulario.
- **FormButton**: Un widget que representa un botón para enviar el formulario.
- **FormGroup**: Un contenedor que agrupa un campo de formulario, una etiqueta y su correspondiente widget de entrada.

---

## Estructura de Directorios

```
anamnesis_app/
├── lib/
│   ├── blocs/                # Contiene el BLoC (anamnesis_bloc.dart, anamnesis_event.dart, anamnesis_state.dart)
│   ├── models/               # Contiene los modelos de datos, pero en esta prueba no se implementa
│   ├── repositories/         # Contiene la logica de negocio y acceso a datos, pero en esta prueba no se implementa
│   ├── screens/              # Contiene el las pantalas de la appa del paso 1 y paso 2
│   ├── theme/                # Contiene los estilos
│   ├── utils/                # Contiene las utilidades y constantes
│   ├── widgets/              # Widgets personalizados (form_button.dart, form_group.dart, etc.)
│   └── main.dart             # Archivo principal de la aplicación
├── assets/
│   └── fonts/                # Fuentes personalizadas
├── pubspec.yaml              # Archivo de configuración de dependencias
├── README.md                 # Este archivo
```

---

## Contribuciones

Las contribuciones son bienvenidas. 

---

Este archivo `README.md` contiene toda la información necesaria para configurar y ejecutar el proyecto, explica el uso de BLoC para la gestión de estado y documenta las decisiones técnicas relevantes, como validaciones y el uso de widgets personalizados. ¡Espero que sea lo que necesitas!