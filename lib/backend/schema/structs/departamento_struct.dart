// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartamentoStruct extends BaseStruct {
  DepartamentoStruct({
    int? id,
    String? name,
    String? descripcion,
  })  : _id = id,
        _name = name,
        _descripcion = descripcion;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  static DepartamentoStruct fromMap(Map<String, dynamic> data) =>
      DepartamentoStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        descripcion: data['descripcion'] as String?,
      );

  static DepartamentoStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartamentoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'descripcion': _descripcion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
      }.withoutNulls;

  static DepartamentoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepartamentoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DepartamentoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepartamentoStruct &&
        id == other.id &&
        name == other.name &&
        descripcion == other.descripcion;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, descripcion]);
}

DepartamentoStruct createDepartamentoStruct({
  int? id,
  String? name,
  String? descripcion,
}) =>
    DepartamentoStruct(
      id: id,
      name: name,
      descripcion: descripcion,
    );
