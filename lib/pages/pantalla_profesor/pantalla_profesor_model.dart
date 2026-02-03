import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
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

  List<AsignaturaStruct> asignaturas = [];
  void addToAsignaturas(AsignaturaStruct item) => asignaturas.add(item);
  void removeFromAsignaturas(AsignaturaStruct item) => asignaturas.remove(item);
  void removeAtIndexFromAsignaturas(int index) => asignaturas.removeAt(index);
  void insertAtIndexInAsignaturas(int index, AsignaturaStruct item) =>
      asignaturas.insert(index, item);
  void updateAsignaturasAtIndex(
    int index,
    Function(AsignaturaStruct) updateFn,
  ) => asignaturas[index] = updateFn(asignaturas[index]);

  bool error = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recogerProfesor] action in PantallaProfesor widget.
  dynamic profe;
  // Stores action output result for [Custom Action - buscarAsignaturasProfe] action in PantallaProfesor widget.
  List<dynamic>? asigna;
  // Stores action output result for [Custom Action - recojerDepartamento] action in PantallaProfesor widget.
  dynamic depar;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
