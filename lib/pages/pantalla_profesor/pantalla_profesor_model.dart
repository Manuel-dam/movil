import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pantalla_profesor_widget.dart' show PantallaProfesorWidget;
import 'package:flutter/material.dart';

class PantallaProfesorModel extends FlutterFlowModel<PantallaProfesorWidget> {
  ///  Local state fields for this page.

  ProfesorStruct? profesor;
  void updateProfesorStruct(Function(ProfesorStruct) updateFn) {
    updateFn(profesor ??= ProfesorStruct());
  }

  DepartamentoStruct? departamento;
  void updateDepartamentoStruct(Function(DepartamentoStruct) updateFn) {
    updateFn(departamento ??= DepartamentoStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recogerProfesor] action in PantallaProfesor widget.
  dynamic profe;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
