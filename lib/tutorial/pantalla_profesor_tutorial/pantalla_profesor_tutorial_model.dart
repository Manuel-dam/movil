import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'pantalla_profesor_tutorial_widget.dart'
    show PantallaProfesorTutorialWidget;
import 'package:flutter/material.dart';

class PantallaProfesorTutorialModel
    extends FlutterFlowModel<PantallaProfesorTutorialWidget> {
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
          int index, Function(AsignaturaStruct) updateFn) =>
      asignaturas[index] = updateFn(asignaturas[index]);

  bool error = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? pantallaProfesorController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pantallaProfesorController?.finish();
  }
}
