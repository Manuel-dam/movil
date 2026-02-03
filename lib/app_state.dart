import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  UsuarioStruct _usuario = UsuarioStruct();
  UsuarioStruct get usuario => _usuario;
  set usuario(UsuarioStruct value) {
    _usuario = value;
  }

  void updateUsuarioStruct(Function(UsuarioStruct) updateFn) {
    updateFn(_usuario);
  }
}
