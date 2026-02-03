import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'targeta_asignatura_model.dart';
export 'targeta_asignatura_model.dart';

class TargetaAsignaturaWidget extends StatefulWidget {
  const TargetaAsignaturaWidget({super.key, required this.aignatura});

  final AsignaturaStruct? aignatura;

  @override
  State<TargetaAsignaturaWidget> createState() =>
      _TargetaAsignaturaWidgetState();
}

class _TargetaAsignaturaWidgetState extends State<TargetaAsignaturaWidget> {
  late TargetaAsignaturaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TargetaAsignaturaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,

          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x0D000000),
              offset: Offset(0.0, 2.0),
            ),
          ],

          borderRadius: BorderRadius.circular(12.0),
        ),

        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,

            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(widget.aignatura?.nombre, 'nore'),

                      style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(
                            context,
                          ).titleMedium.fontStyle,
                        ),

                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(
                          context,
                        ).titleMedium.fontStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
