import '../database.dart';

class AsignaturaTable extends SupabaseTable<AsignaturaRow> {
  @override
  String get tableName => 'asignatura';

  @override
  AsignaturaRow createRow(Map<String, dynamic> data) => AsignaturaRow(data);
}

class AsignaturaRow extends SupabaseDataRow {
  AsignaturaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AsignaturaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String get descripcion => getField<String>('descripcion')!;
  set descripcion(String value) => setField<String>('descripcion', value);

  int get creditos => getField<int>('creditos')!;
  set creditos(int value) => setField<int>('creditos', value);

  int get ano => getField<int>('ano')!;
  set ano(int value) => setField<int>('ano', value);

  int get carrera => getField<int>('carrera')!;
  set carrera(int value) => setField<int>('carrera', value);

  int? get profesor => getField<int>('profesor');
  set profesor(int? value) => setField<int>('profesor', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
