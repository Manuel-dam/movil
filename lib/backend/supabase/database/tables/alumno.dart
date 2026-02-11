import '../database.dart';

class AlumnoTable extends SupabaseTable<AlumnoRow> {
  @override
  String get tableName => 'alumno';

  @override
  AlumnoRow createRow(Map<String, dynamic> data) => AlumnoRow(data);
}

class AlumnoRow extends SupabaseDataRow {
  AlumnoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlumnoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get carrera => getField<int>('carrera');
  set carrera(int? value) => setField<int>('carrera', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
