import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tarjeta_alumno_widget.dart' show TarjetaAlumnoWidget;
import 'package:flutter/material.dart';

class TarjetaAlumnoModel extends FlutterFlowModel<TarjetaAlumnoWidget> {
  ///  Local state fields for this component.

  UsuarioStruct? alumno;
  void updateAlumnoStruct(Function(UsuarioStruct) updateFn) {
    updateFn(alumno ??= UsuarioStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - buscarUsuarioConcreto] action in tarjetaAlumno widget.
  dynamic profe;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
