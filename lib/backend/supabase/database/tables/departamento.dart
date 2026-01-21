import '../database.dart';

class DepartamentoTable extends SupabaseTable<DepartamentoRow> {
  @override
  String get tableName => 'departamento';

  @override
  DepartamentoRow createRow(Map<String, dynamic> data) => DepartamentoRow(data);
}

class DepartamentoRow extends SupabaseDataRow {
  DepartamentoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DepartamentoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get descripcion => getField<String>('descripcion')!;
  set descripcion(String value) => setField<String>('descripcion', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
