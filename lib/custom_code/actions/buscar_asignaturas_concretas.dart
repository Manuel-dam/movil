// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> buscarAsignaturasConcretas(
    List<MatriculaStruct> matriculas) async {
  final supabase = Supabase.instance.client;

  final ids = matriculas.map((m) => m.asignatura).toList();

  final res =
      await supabase.from('asignatura').select().filter('id', 'in', ids);

  return res;
}
