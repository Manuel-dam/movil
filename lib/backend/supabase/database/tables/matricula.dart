import '../database.dart';

class MatriculaTable extends SupabaseTable<MatriculaRow> {
  @override
  String get tableName => 'matricula';

  @override
  MatriculaRow createRow(Map<String, dynamic> data) => MatriculaRow(data);
}

class MatriculaRow extends SupabaseDataRow {
  MatriculaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatriculaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get alumno => getField<int>('alumno')!;
  set alumno(int value) => setField<int>('alumno', value);

  int get asignatura => getField<int>('asignatura')!;
  set asignatura(int value) => setField<int>('asignatura', value);

  double get nota => getField<double>('nota')!;
  set nota(double value) => setField<double>('nota', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
