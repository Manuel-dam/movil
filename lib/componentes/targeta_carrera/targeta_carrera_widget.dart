import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'targeta_carrera_model.dart';
export 'targeta_carrera_model.dart';

class TargetaCarreraWidget extends StatefulWidget {
  const TargetaCarreraWidget({super.key, required this.carrera, this.callback});

  final CarreraStruct? carrera;
  final Future Function()? callback;

  @override
  State<TargetaCarreraWidget> createState() => _TargetaCarreraWidgetState();
}

class _TargetaCarreraWidgetState extends State<TargetaCarreraWidget>
    with TickerProviderStateMixin {
  late TargetaCarreraModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TargetaCarreraModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.carrerasJso = await actions.buscarAsignaturas(
        widget.carrera!.id.toString(),
      );
      _model.asignaturas = _model.carrerasJso!
          .map((e) => AsignaturaStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<AsignaturaStruct>();
      safeSetState(() {});
    });

    animationsMap.addAll({
      'flippableCardOnActionTriggerAnimation': AnimationInfo(
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
    context.watch<FFAppState>();

    return FlipCard(
      fill: Fill.fillBack,

      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onHorizontalDragEnd: (details) async {
            if (_model.offsetX! > 100.0) {
              var confirmDialogResponse =
                  await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Matriculación'),
                        content: Text(
                          '¿Estas seguro de querer matricularte de esta asignatura?',
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
                await actions.matricularAlumnoCarrera(
                  FFAppState().usuario.id,
                  widget.carrera!.id,
                  _model.asignaturas.toList(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Matricul aexitosa',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            } else {
              if (animationsMap['flippableCardOnActionTriggerAnimation'] !=
                  null) {
                await animationsMap['flippableCardOnActionTriggerAnimation']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                      animationsMap['flippableCardOnActionTriggerAnimation']!
                          .controller
                          .reverse,
                    );
              }
            }

            _model.offsetX = 0.0;
            safeSetState(() {});
          },
          onHorizontalDragUpdate: (details) async {
            _model.offsetX = _model.offsetX! + details.delta.dx;
            safeSetState(() {});
            if (animationsMap['flippableCardOnActionTriggerAnimation'] !=
                null) {
              await animationsMap['flippableCardOnActionTriggerAnimation']!
                  .controller
                  .forward(from: 0.0);
            }
          },

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
                          valueOrDefault<String>(
                            widget.carrera?.nombre,
                            'carreraNombre',
                          ),

                          style: FlutterFlowTheme.of(context).titleMedium
                              .override(
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            4.0,
                            0.0,
                            0.0,
                          ),
                          child: Text(
                            valueOrDefault<String>(
                              widget.carrera?.anos.toString(),
                              '2323',
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
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ),
        ),
      ),
      back: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onHorizontalDragEnd: (details) async {
            if (_model.offsetX! > 100.0) {
              var confirmDialogResponse =
                  await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Matriculación'),
                        content: Text(
                          '¿Estas seguro de querer matricularte de esta asignatura?',
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
                await actions.matricularAlumnoCarrera(
                  FFAppState().usuario.id,
                  widget.carrera!.id,
                  _model.asignaturas.toList(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Matricul aexitosa',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            } else {
              if (animationsMap['flippableCardOnActionTriggerAnimation'] !=
                  null) {
                await animationsMap['flippableCardOnActionTriggerAnimation']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                      animationsMap['flippableCardOnActionTriggerAnimation']!
                          .controller
                          .reverse,
                    );
              }
            }

            _model.offsetX = 0.0;
            safeSetState(() {});
          },
          onHorizontalDragUpdate: (details) async {
            _model.offsetX = _model.offsetX! + details.delta.dx;
            safeSetState(() {});
            if (animationsMap['flippableCardOnActionTriggerAnimation'] !=
                null) {
              await animationsMap['flippableCardOnActionTriggerAnimation']!
                  .controller
                  .forward(from: 0.0);
            }
          },

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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            4.0,
                            0.0,
                            0.0,
                          ),
                          child: Text(
                            valueOrDefault<String>(
                              widget.carrera?.descripcion,
                              'descripou',
                            ),

                            style: FlutterFlowTheme.of(context).bodySmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(
                                      context,
                                    ).bodySmall.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).bodySmall.fontStyle,
                                  ),

                                  color: FlutterFlowTheme.of(
                                    context,
                                  ).secondaryText,

                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).bodySmall.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodySmall.fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ),
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['flippableCardOnActionTriggerAnimation']!,

      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.0.ms,
          duration: 0.0.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(valueOrDefault<double>(_model.offsetX, 0.0), 0.0),
        ),
      ],
    );
  }
}
