import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'targeta_carrera_widget.dart' show TargetaCarreraWidget;
import 'package:flutter/material.dart';

class TargetaCarreraModel extends FlutterFlowModel<TargetaCarreraWidget> {
  ///  Local state fields for this component.

  double? offsetX = 0.0;

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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - buscarAsignaturas] action in targetaCarrera widget.
  List<dynamic>? carrerasJso;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
