import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'usuario';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get correo => getField<String>('correo')!;
  set correo(String value) => setField<String>('correo', value);

  String get rol => getField<String>('rol')!;
  set rol(String value) => setField<String>('rol', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get apellidos => getField<String>('apellidos')!;
  set apellidos(String value) => setField<String>('apellidos', value);

  int get edad => getField<int>('edad')!;
  set edad(int value) => setField<int>('edad', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
