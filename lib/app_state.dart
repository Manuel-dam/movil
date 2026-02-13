import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _onBoardingShow = prefs.getBool('ff_onBoardingShow') ?? _onBoardingShow;
    });
    _safeInit(() {
      _alumnoTutorial = prefs.getBool('ff_alumnoTutorial') ?? _alumnoTutorial;
    });
    _safeInit(() {
      _profesorTutorial =
          prefs.getBool('ff_profesorTutorial') ?? _profesorTutorial;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UsuarioStruct _usuario = UsuarioStruct();
  UsuarioStruct get usuario => _usuario;
  set usuario(UsuarioStruct value) {
    _usuario = value;
  }

  void updateUsuarioStruct(Function(UsuarioStruct) updateFn) {
    updateFn(_usuario);
  }

  bool _onBoardingShow = true;
  bool get onBoardingShow => _onBoardingShow;
  set onBoardingShow(bool value) {
    _onBoardingShow = value;
    prefs.setBool('ff_onBoardingShow', value);
  }

  bool _alumnoTutorial = true;
  bool get alumnoTutorial => _alumnoTutorial;
  set alumnoTutorial(bool value) {
    _alumnoTutorial = value;
    prefs.setBool('ff_alumnoTutorial', value);
  }

  bool _profesorTutorial = true;
  bool get profesorTutorial => _profesorTutorial;
  set profesorTutorial(bool value) {
    _profesorTutorial = value;
    prefs.setBool('ff_profesorTutorial', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
