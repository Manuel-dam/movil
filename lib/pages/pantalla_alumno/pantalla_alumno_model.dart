import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pantalla_alumno_widget.dart' show PantallaAlumnoWidget;
import 'package:flutter/material.dart';

class PantallaAlumnoModel extends FlutterFlowModel<PantallaAlumnoWidget> {
  ///  Local state fields for this page.

  List<CarreraStruct> carreras = [];
  void addToCarreras(CarreraStruct item) => carreras.add(item);
  void removeFromCarreras(CarreraStruct item) => carreras.remove(item);
  void removeAtIndexFromCarreras(int index) => carreras.removeAt(index);
  void insertAtIndexInCarreras(int index, CarreraStruct item) =>
      carreras.insert(index, item);
  void updateCarrerasAtIndex(int index, Function(CarreraStruct) updateFn) =>
      carreras[index] = updateFn(carreras[index]);

  List<AsignaturaStruct> asignaturas = [];
  void addToAsignaturas(AsignaturaStruct item) => asignaturas.add(item);
  void removeFromAsignaturas(AsignaturaStruct item) => asignaturas.remove(item);
  void removeAtIndexFromAsignaturas(int index) => asignaturas.removeAt(index);
  void insertAtIndexInAsignaturas(int index, AsignaturaStruct item) =>
      asignaturas.insert(index, item);
  void updateAsignaturasAtIndex(
          int index, Function(AsignaturaStruct) updateFn) =>
      asignaturas[index] = updateFn(asignaturas[index]);

  List<MatriculaStruct> matriculas = [];
  void addToMatriculas(MatriculaStruct item) => matriculas.add(item);
  void removeFromMatriculas(MatriculaStruct item) => matriculas.remove(item);
  void removeAtIndexFromMatriculas(int index) => matriculas.removeAt(index);
  void insertAtIndexInMatriculas(int index, MatriculaStruct item) =>
      matriculas.insert(index, item);
  void updateMatriculasAtIndex(int index, Function(MatriculaStruct) updateFn) =>
      matriculas[index] = updateFn(matriculas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - buscarMatricula] action in PantallaAlumno widget.
  List<dynamic>? matriculass;
  // Stores action output result for [Custom Action - listarCarreras] action in PantallaAlumno widget.
  List<dynamic>? carrerasJSO;
  // Stores action output result for [Custom Action - buscarAsignaturasConcretas] action in PantallaAlumno widget.
  List<dynamic>? asignaturasCocretas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
