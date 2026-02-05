import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'asignatura_detalles_widget.dart' show AsignaturaDetallesWidget;
import 'package:flutter/material.dart';

class AsignaturaDetallesModel
    extends FlutterFlowModel<AsignaturaDetallesWidget> {
  ///  Local state fields for this page.

  CarreraStruct? carrera;
  void updateCarreraStruct(Function(CarreraStruct) updateFn) {
    updateFn(carrera ??= CarreraStruct());
  }

  UsuarioStruct? profesor;
  void updateProfesorStruct(Function(UsuarioStruct) updateFn) {
    updateFn(profesor ??= UsuarioStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - buscarCarreraConcreta] action in AsignaturaDetalles widget.
  dynamic carreraJSON;
  // Stores action output result for [Custom Action - buscarUsuarioConcreto] action in AsignaturaDetalles widget.
  dynamic profesorJSON;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
