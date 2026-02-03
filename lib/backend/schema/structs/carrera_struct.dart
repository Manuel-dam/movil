// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarreraStruct extends BaseStruct {
  CarreraStruct({int? id, String? nombre, String? descripcion, int? anos})
    : _id = id,
      _nombre = nombre,
      _descripcion = descripcion,
      _anos = anos;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "anos" field.
  int? _anos;
  int get anos => _anos ?? 0;
  set anos(int? val) => _anos = val;

  void incrementAnos(int amount) => anos = anos + amount;

  bool hasAnos() => _anos != null;

  static CarreraStruct fromMap(Map<String, dynamic> data) => CarreraStruct(
    id: castToType<int>(data['id']),
    nombre: data['nombre'] as String?,
    descripcion: data['descripcion'] as String?,
    anos: castToType<int>(data['anos']),
  );

  static CarreraStruct? maybeFromMap(dynamic data) =>
      data is Map ? CarreraStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
    'id': _id,
    'nombre': _nombre,
    'descripcion': _descripcion,
    'anos': _anos,
  }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
    'id': serializeParam(_id, ParamType.int),
    'nombre': serializeParam(_nombre, ParamType.String),
    'descripcion': serializeParam(_descripcion, ParamType.String),
    'anos': serializeParam(_anos, ParamType.int),
  }.withoutNulls;

  static CarreraStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarreraStruct(
        id: deserializeParam(data['id'], ParamType.int, false),
        nombre: deserializeParam(data['nombre'], ParamType.String, false),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
        anos: deserializeParam(data['anos'], ParamType.int, false),
      );

  @override
  String toString() => 'CarreraStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarreraStruct &&
        id == other.id &&
        nombre == other.nombre &&
        descripcion == other.descripcion &&
        anos == other.anos;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nombre, descripcion, anos]);
}

CarreraStruct createCarreraStruct({
  int? id,
  String? nombre,
  String? descripcion,
  int? anos,
}) =>
    CarreraStruct(id: id, nombre: nombre, descripcion: descripcion, anos: anos);
