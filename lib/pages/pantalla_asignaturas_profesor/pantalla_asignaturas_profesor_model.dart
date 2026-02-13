import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pantalla_asignaturas_profesor_widget.dart'
    show PantallaAsignaturasProfesorWidget;
import 'package:flutter/material.dart';

class PantallaAsignaturasProfesorModel
    extends FlutterFlowModel<PantallaAsignaturasProfesorWidget> {
  ///  Local state fields for this page.

  List<MatriculaStruct> alumnos = [];
  void addToAlumnos(MatriculaStruct item) => alumnos.add(item);
  void removeFromAlumnos(MatriculaStruct item) => alumnos.remove(item);
  void removeAtIndexFromAlumnos(int index) => alumnos.removeAt(index);
  void insertAtIndexInAlumnos(int index, MatriculaStruct item) =>
      alumnos.insert(index, item);
  void updateAlumnosAtIndex(int index, Function(MatriculaStruct) updateFn) =>
      alumnos[index] = updateFn(alumnos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - buscarMatriculaAsignatura] action in PantallaAsignaturasProfesor widget.
  List<dynamic>? lista;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
