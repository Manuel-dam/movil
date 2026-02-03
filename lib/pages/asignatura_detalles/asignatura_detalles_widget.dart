import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'asignatura_detalles_model.dart';
export 'asignatura_detalles_model.dart';

/// crea una pantalla que tendra que mostrar la informacion de una asignatura,
/// siendo esta informacion, el nombre, una descripcion, a que carrera
/// pertenece, cuantos años dura y que profesor la imparte
class AsignaturaDetallesWidget extends StatefulWidget {
  const AsignaturaDetallesWidget({super.key, required this.asignatura});

  final AsignaturaStruct? asignatura;

  static String routeName = 'AsignaturaDetalles';
  static String routePath = '/asignaturaDetalles';

  @override
  State<AsignaturaDetallesWidget> createState() =>
      _AsignaturaDetallesWidgetState();
}

class _AsignaturaDetallesWidgetState extends State<AsignaturaDetallesWidget> {
  late AsignaturaDetallesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsignaturaDetallesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.carreraJSON = await actions.buscarCarreraConcreta(
        widget.asignatura!.carrera,
      );
      _model.carrera = CarreraStruct.maybeFromMap(_model.carreraJSON);
      safeSetState(() {});
      _model.profesorJSON = await actions.buscarUsuarioConcreto(
        widget.asignatura!.profesor.toString(),
      );
      _model.profesor = UsuarioStruct.maybeFromMap(_model.profesorJSON);
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,

        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,

            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),

            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Información de Asignatura',

            style: FlutterFlowTheme.of(context).titleLarge.override(
              font: GoogleFonts.interTight(
                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),

              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
            ),
          ),
          actions: [],

          centerTitle: true,

          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,

                children:
                    [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(
                                  context,
                                ).secondaryBackground,

                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color(0x1A000000),
                                    offset: Offset(0.0, 2.0),
                                  ),
                                ],

                                borderRadius: BorderRadius.circular(16.0),
                              ),

                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,

                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,

                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).primary,

                                            borderRadius: BorderRadius.circular(
                                              12.0,
                                            ),
                                          ),

                                          child: Align(
                                            alignment: AlignmentDirectional(
                                              0.0,
                                              0.0,
                                            ),
                                            child: Icon(
                                              Icons.school_rounded,
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).info,
                                              size: 28.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,

                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.asignatura?.nombre,
                                                  'asignatura',
                                                ),

                                                style:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).headlineSmall.override(
                                                      font: GoogleFonts.interTight(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),

                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Divider(
                                      thickness: 1.0,

                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).alternate,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,

                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            widget.asignatura?.descripcion,
                                            'descripcion',
                                          ),

                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontStyle,
                                                ),

                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.fontStyle,

                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(
                                  context,
                                ).secondaryBackground,

                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color(0x1A000000),
                                    offset: Offset(0.0, 2.0),
                                  ),
                                ],

                                borderRadius: BorderRadius.circular(16.0),
                              ),

                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,

                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,

                                      children: [
                                        Icon(
                                          Icons.business_center_rounded,
                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).primary,
                                          size: 24.0,
                                        ),
                                        Text(
                                          'Detalles Académicos',

                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
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
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,

                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              'Carrera:',

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.carrera?.nombre,
                                                'carrrea',
                                              ),

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    color: FlutterFlowTheme.of(
                                                      context,
                                                    ).primary,

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 0.5,

                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).alternate,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              'Duración:',

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.asignatura?.ano
                                                    .toString(),
                                                '21',
                                              ),

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    color: FlutterFlowTheme.of(
                                                      context,
                                                    ).primary,

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 0.5,

                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).alternate,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              'Créditos:',

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.asignatura?.creditos
                                                    .toString(),
                                                '2',
                                              ),

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    color: FlutterFlowTheme.of(
                                                      context,
                                                    ).primary,

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              'Nota:',

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.asignatura?.creditos
                                                    .toString(),
                                                '2',
                                              ),

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),

                                                    color: FlutterFlowTheme.of(
                                                      context,
                                                    ).primary,

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,

                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(
                                  context,
                                ).secondaryBackground,

                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color(0x1A000000),
                                    offset: Offset(0.0, 2.0),
                                  ),
                                ],

                                borderRadius: BorderRadius.circular(16.0),
                              ),

                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,

                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,

                                      children: [
                                        Icon(
                                          Icons.person_rounded,
                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).primary,
                                          size: 24.0,
                                        ),
                                        Text(
                                          'Profesor',

                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
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
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,

                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,

                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).accent1,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,

                                              image: Image.network(
                                                'https://images.unsplash.com/photo-1741392076269-471898558663?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3Njk2MTgxNjl8&ixlib=rb-4.1.0&q=80&w=1080',
                                              ).image,
                                            ),

                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,

                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                functions.montarNombreCompleto(
                                                  _model.profesor!.nombre,
                                                  _model.profesor!.apellidos,
                                                ),

                                                style:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).titleSmall.override(
                                                      font: GoogleFonts.interTight(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),

                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0.0,
                                                      2.0,
                                                      0.0,
                                                      0.0,
                                                    ),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model.profesor?.correo,
                                                    'correo',
                                                  ),

                                                  style:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodySmall.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),

                                                        color:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).secondaryText,

                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        ]
                        .divide(SizedBox(height: 24.0))
                        .addToStart(SizedBox(height: 24.0))
                        .addToEnd(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
