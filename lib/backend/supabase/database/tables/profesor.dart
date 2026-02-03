import '../database.dart';

class ProfesorTable extends SupabaseTable<ProfesorRow> {
  @override
  String get tableName => 'profesor';

  @override
  ProfesorRow createRow(Map<String, dynamic> data) => ProfesorRow(data);
}

class ProfesorRow extends SupabaseDataRow {
  ProfesorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfesorTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get departamento => getField<int>('departamento');
  set departamento(int? value) => setField<int>('departamento', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
