// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatriculaStruct extends BaseStruct {
  MatriculaStruct({
    int? id,
    int? alumno,
    int? asignatura,
    double? nota,
  })  : _id = id,
        _alumno = alumno,
        _asignatura = asignatura,
        _nota = nota;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "alumno" field.
  int? _alumno;
  int get alumno => _alumno ?? 0;
  set alumno(int? val) => _alumno = val;

  void incrementAlumno(int amount) => alumno = alumno + amount;

  bool hasAlumno() => _alumno != null;

  // "asignatura" field.
  int? _asignatura;
  int get asignatura => _asignatura ?? 0;
  set asignatura(int? val) => _asignatura = val;

  void incrementAsignatura(int amount) => asignatura = asignatura + amount;

  bool hasAsignatura() => _asignatura != null;

  // "nota" field.
  double? _nota;
  double get nota => _nota ?? 0.0;
  set nota(double? val) => _nota = val;

  void incrementNota(double amount) => nota = nota + amount;

  bool hasNota() => _nota != null;

  static MatriculaStruct fromMap(Map<String, dynamic> data) => MatriculaStruct(
        id: castToType<int>(data['id']),
        alumno: castToType<int>(data['alumno']),
        asignatura: castToType<int>(data['asignatura']),
        nota: castToType<double>(data['nota']),
      );

  static MatriculaStruct? maybeFromMap(dynamic data) => data is Map
      ? MatriculaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'alumno': _alumno,
        'asignatura': _asignatura,
        'nota': _nota,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'alumno': serializeParam(
          _alumno,
          ParamType.int,
        ),
        'asignatura': serializeParam(
          _asignatura,
          ParamType.int,
        ),
        'nota': serializeParam(
          _nota,
          ParamType.double,
        ),
      }.withoutNulls;

  static MatriculaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MatriculaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        alumno: deserializeParam(
          data['alumno'],
          ParamType.int,
          false,
        ),
        asignatura: deserializeParam(
          data['asignatura'],
          ParamType.int,
          false,
        ),
        nota: deserializeParam(
          data['nota'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MatriculaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatriculaStruct &&
        id == other.id &&
        alumno == other.alumno &&
        asignatura == other.asignatura &&
        nota == other.nota;
  }

  @override
  int get hashCode => const ListEquality().hash([id, alumno, asignatura, nota]);
}

MatriculaStruct createMatriculaStruct({
  int? id,
  int? alumno,
  int? asignatura,
  double? nota,
}) =>
    MatriculaStruct(
      id: id,
      alumno: alumno,
      asignatura: asignatura,
      nota: nota,
    );
