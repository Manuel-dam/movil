// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfesorStruct extends BaseStruct {
  ProfesorStruct({
    int? id,
    int? departamento,
  })  : _id = id,
        _departamento = departamento;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "departamento" field.
  int? _departamento;
  int get departamento => _departamento ?? 0;
  set departamento(int? val) => _departamento = val;

  void incrementDepartamento(int amount) =>
      departamento = departamento + amount;

  bool hasDepartamento() => _departamento != null;

  static ProfesorStruct fromMap(Map<String, dynamic> data) => ProfesorStruct(
        id: castToType<int>(data['id']),
        departamento: castToType<int>(data['departamento']),
      );

  static ProfesorStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProfesorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'departamento': _departamento,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'departamento': serializeParam(
          _departamento,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProfesorStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfesorStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        departamento: deserializeParam(
          data['departamento'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProfesorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfesorStruct &&
        id == other.id &&
        departamento == other.departamento;
  }

  @override
  int get hashCode => const ListEquality().hash([id, departamento]);
}

ProfesorStruct createProfesorStruct({
  int? id,
  int? departamento,
}) =>
    ProfesorStruct(
      id: id,
      departamento: departamento,
    );
