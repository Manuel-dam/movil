// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuarioStruct extends BaseStruct {
  UsuarioStruct({
    int? id,
    String? correo,
    String? rol,
    String? nombre,
    String? apellidos,
    int? edad,
    String? contrasena,
  }) : _id = id,
       _correo = correo,
       _rol = rol,
       _nombre = nombre,
       _apellidos = apellidos,
       _edad = edad,
       _contrasena = contrasena;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  set correo(String? val) => _correo = val;

  bool hasCorreo() => _correo != null;

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  set rol(String? val) => _rol = val;

  bool hasRol() => _rol != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "apellidos" field.
  String? _apellidos;
  String get apellidos => _apellidos ?? '';
  set apellidos(String? val) => _apellidos = val;

  bool hasApellidos() => _apellidos != null;

  // "edad" field.
  int? _edad;
  int get edad => _edad ?? 0;
  set edad(int? val) => _edad = val;

  void incrementEdad(int amount) => edad = edad + amount;

  bool hasEdad() => _edad != null;

  // "contrasena" field.
  String? _contrasena;
  String get contrasena => _contrasena ?? '';
  set contrasena(String? val) => _contrasena = val;

  bool hasContrasena() => _contrasena != null;

  static UsuarioStruct fromMap(Map<String, dynamic> data) => UsuarioStruct(
    id: castToType<int>(data['id']),
    correo: data['correo'] as String?,
    rol: data['rol'] as String?,
    nombre: data['nombre'] as String?,
    apellidos: data['apellidos'] as String?,
    edad: castToType<int>(data['edad']),
    contrasena: data['contrasena'] as String?,
  );

  static UsuarioStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsuarioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
    'id': _id,
    'correo': _correo,
    'rol': _rol,
    'nombre': _nombre,
    'apellidos': _apellidos,
    'edad': _edad,
    'contrasena': _contrasena,
  }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
    'id': serializeParam(_id, ParamType.int),
    'correo': serializeParam(_correo, ParamType.String),
    'rol': serializeParam(_rol, ParamType.String),
    'nombre': serializeParam(_nombre, ParamType.String),
    'apellidos': serializeParam(_apellidos, ParamType.String),
    'edad': serializeParam(_edad, ParamType.int),
    'contrasena': serializeParam(_contrasena, ParamType.String),
  }.withoutNulls;

  static UsuarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuarioStruct(
        id: deserializeParam(data['id'], ParamType.int, false),
        correo: deserializeParam(data['correo'], ParamType.String, false),
        rol: deserializeParam(data['rol'], ParamType.String, false),
        nombre: deserializeParam(data['nombre'], ParamType.String, false),
        apellidos: deserializeParam(data['apellidos'], ParamType.String, false),
        edad: deserializeParam(data['edad'], ParamType.int, false),
        contrasena: deserializeParam(
          data['contrasena'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsuarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsuarioStruct &&
        id == other.id &&
        correo == other.correo &&
        rol == other.rol &&
        nombre == other.nombre &&
        apellidos == other.apellidos &&
        edad == other.edad &&
        contrasena == other.contrasena;
  }

  @override
  int get hashCode => const ListEquality().hash([
    id,
    correo,
    rol,
    nombre,
    apellidos,
    edad,
    contrasena,
  ]);
}

UsuarioStruct createUsuarioStruct({
  int? id,
  String? correo,
  String? rol,
  String? nombre,
  String? apellidos,
  int? edad,
  String? contrasena,
}) => UsuarioStruct(
  id: id,
  correo: correo,
  rol: rol,
  nombre: nombre,
  apellidos: apellidos,
  edad: edad,
  contrasena: contrasena,
);
