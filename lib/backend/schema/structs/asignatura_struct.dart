// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AsignaturaStruct extends BaseStruct {
  AsignaturaStruct({
    int? id,
    String? nombre,
    String? descripcion,
    int? creditos,
    int? ano,
    int? carrera,
    int? profesor,
  })  : _id = id,
        _nombre = nombre,
        _descripcion = descripcion,
        _creditos = creditos,
        _ano = ano,
        _carrera = carrera,
        _profesor = profesor;

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

  // "creditos" field.
  int? _creditos;
  int get creditos => _creditos ?? 0;
  set creditos(int? val) => _creditos = val;

  void incrementCreditos(int amount) => creditos = creditos + amount;

  bool hasCreditos() => _creditos != null;

  // "ano" field.
  int? _ano;
  int get ano => _ano ?? 0;
  set ano(int? val) => _ano = val;

  void incrementAno(int amount) => ano = ano + amount;

  bool hasAno() => _ano != null;

  // "carrera" field.
  int? _carrera;
  int get carrera => _carrera ?? 0;
  set carrera(int? val) => _carrera = val;

  void incrementCarrera(int amount) => carrera = carrera + amount;

  bool hasCarrera() => _carrera != null;

  // "profesor" field.
  int? _profesor;
  int get profesor => _profesor ?? 0;
  set profesor(int? val) => _profesor = val;

  void incrementProfesor(int amount) => profesor = profesor + amount;

  bool hasProfesor() => _profesor != null;

  static AsignaturaStruct fromMap(Map<String, dynamic> data) =>
      AsignaturaStruct(
        id: castToType<int>(data['id']),
        nombre: data['nombre'] as String?,
        descripcion: data['descripcion'] as String?,
        creditos: castToType<int>(data['creditos']),
        ano: castToType<int>(data['ano']),
        carrera: castToType<int>(data['carrera']),
        profesor: castToType<int>(data['profesor']),
      );

  static AsignaturaStruct? maybeFromMap(dynamic data) => data is Map
      ? AsignaturaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nombre': _nombre,
        'descripcion': _descripcion,
        'creditos': _creditos,
        'ano': _ano,
        'carrera': _carrera,
        'profesor': _profesor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'creditos': serializeParam(
          _creditos,
          ParamType.int,
        ),
        'ano': serializeParam(
          _ano,
          ParamType.int,
        ),
        'carrera': serializeParam(
          _carrera,
          ParamType.int,
        ),
        'profesor': serializeParam(
          _profesor,
          ParamType.int,
        ),
      }.withoutNulls;

  static AsignaturaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AsignaturaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
        creditos: deserializeParam(
          data['creditos'],
          ParamType.int,
          false,
        ),
        ano: deserializeParam(
          data['ano'],
          ParamType.int,
          false,
        ),
        carrera: deserializeParam(
          data['carrera'],
          ParamType.int,
          false,
        ),
        profesor: deserializeParam(
          data['profesor'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AsignaturaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AsignaturaStruct &&
        id == other.id &&
        nombre == other.nombre &&
        descripcion == other.descripcion &&
        creditos == other.creditos &&
        ano == other.ano &&
        carrera == other.carrera &&
        profesor == other.profesor;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, nombre, descripcion, creditos, ano, carrera, profesor]);
}

AsignaturaStruct createAsignaturaStruct({
  int? id,
  String? nombre,
  String? descripcion,
  int? creditos,
  int? ano,
  int? carrera,
  int? profesor,
}) =>
    AsignaturaStruct(
      id: id,
      nombre: nombre,
      descripcion: descripcion,
      creditos: creditos,
      ano: ano,
      carrera: carrera,
      profesor: profesor,
    );
