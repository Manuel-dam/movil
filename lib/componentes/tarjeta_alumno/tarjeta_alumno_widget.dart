import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tarjeta_alumno_model.dart';
export 'tarjeta_alumno_model.dart';

class TarjetaAlumnoWidget extends StatefulWidget {
  const TarjetaAlumnoWidget({super.key, this.matricula});

  final MatriculaStruct? matricula;

  @override
  State<TarjetaAlumnoWidget> createState() => _TarjetaAlumnoWidgetState();
}

class _TarjetaAlumnoWidgetState extends State<TarjetaAlumnoWidget>
    with TickerProviderStateMixin {
  late TarjetaAlumnoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TarjetaAlumnoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.profe = await actions.buscarUsuarioConcreto(
        widget.matricula!.alumno.toString(),
      );
      _model.alumno = UsuarioStruct.maybeFromMap(_model.profe);
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
    });
    setupAnimations(
      animationsMap.values.where(
        (anim) =>
            anim.trigger == AnimationTrigger.onActionTrigger ||
            !anim.applyInitialState,
      ),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child:
          GestureDetector(
            onTap: () async {
              context.pushNamed(
                AlumnoDetallesModificarWidget.routeName,

                queryParameters: {
                  'alumno': serializeParam(_model.alumno, ParamType.DataStruct),
                  'matricula': serializeParam(
                    widget.matricula,
                    ParamType.DataStruct,
                  ),
                }.withoutNulls,
              );
            },
            onHorizontalDragEnd: (details) async {
              if (_model.offsetX > 100.0) {
                var confirmDialogResponse =
                    await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Matriculación'),
                          content: Text(
                            '¿Estas seguro de querer desmatricular a este alumno?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Sí'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  await actions.eliminarMatricula(
                    widget.matricula!.id.toString(),
                  );
                }
              } else {
                if (animationsMap['containerOnActionTriggerAnimation'] !=
                    null) {
                  await animationsMap['containerOnActionTriggerAnimation']!
                      .controller
                      .forward(from: 0.0)
                      .whenComplete(
                        animationsMap['containerOnActionTriggerAnimation']!
                            .controller
                            .reverse,
                      );
                }
              }

              _model.offsetX = 0.0;
              safeSetState(() {});
            },
            onHorizontalDragUpdate: (details) async {
              _model.offsetX = _model.offsetX + details.delta.dx;
              safeSetState(() {});
              if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                await animationsMap['containerOnActionTriggerAnimation']!
                    .controller
                    .forward(from: 0.0);
              }
            },

            child: Container(
              width: double.infinity,
              height: 80.0,

              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,

                borderRadius: BorderRadius.circular(12.0),

                border: Border.all(color: Color(0xFFF0F0F0), width: 1.0),
              ),

              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          16.0,
                          0.0,
                          16.0,
                          0.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              functions.montarNombreCompleto(
                                _model.alumno!.nombre,
                                _model.alumno!.apellidos,
                              ),

                              style: FlutterFlowTheme.of(context).titleMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).titleMedium.fontStyle,
                                    ),

                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).titleMedium.fontStyle,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                2.0,
                                0.0,
                                0.0,
                              ),
                              child: Text(
                                functions.montarNombreCompleto(
                                  'ID:',
                                  _model.alumno!.id.toString(),
                                ),

                                style: FlutterFlowTheme.of(context).bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),

                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,

                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.matricula?.nota.toString(),
                            '0.0',
                          ),

                          style: FlutterFlowTheme.of(context).bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,

            effects: [
              MoveEffect(
                curve: Curves.linear,
                delay: 0.0.ms,
                duration: 0.0.ms,
                begin: Offset(0.0, 0.0),
                end: Offset(valueOrDefault<double>(_model.offsetX, 0.0), 0.0),
              ),
            ],
          ),
    );
  }
}
