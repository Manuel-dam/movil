import '/backend/schema/structs/index.dart';
import '/componentes/targeta_asignatura_profe/targeta_asignatura_profe_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pantalla_profesor_model.dart';
export 'pantalla_profesor_model.dart';

/// creame una pantalla que contenga la informacion de un profesor, la
/// informacion es el nombre completo y su edad, y el departamento al que
/// pertenece, ademas una lista de asignaturas que esta impartiendo clase
class PantallaProfesorWidget extends StatefulWidget {
  const PantallaProfesorWidget({super.key});

  static String routeName = 'PantallaProfesor';
  static String routePath = '/pantallaProfesor';

  @override
  State<PantallaProfesorWidget> createState() => _PantallaProfesorWidgetState();
}

class _PantallaProfesorWidgetState extends State<PantallaProfesorWidget> {
  late PantallaProfesorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PantallaProfesorModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.profe = await actions.recogerProfesor(
        FFAppState().usuario.id.toString(),
      );
      _model.profesor = ProfesorStruct.maybeFromMap(_model.profe);
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          _model.asigna = await actions.buscarAsignaturasProfe(
            _model.profesor!.id,
          );
          _model.asignaturas = _model.asigna!
              .map((e) => AsignaturaStruct.maybeFromMap(e))
              .withoutNulls
              .toList()
              .toList()
              .cast<AsignaturaStruct>();
          safeSetState(() {});
        }),
        Future(() async {
          _model.depar = await actions.recojerDepartamento(
            _model.profesor!.departamento.toString(),
          );
          _model.departamento = DepartamentoStruct.maybeFromMap(_model.depar);
          safeSetState(() {});
        }),
      ]);
      if (_model.departamento != null) {
        if (_model.asignaturas.length <= 0) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('ERROR'),
                content: Text('No tienes asignado ninguna asignatura'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          _model.error = true;
          safeSetState(() {});
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ERROR'),
              content: Text('No tienes asignado ningun departamento'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        _model.error = true;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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

            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Home',

            style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.interTight(
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(
                  context,
                ).headlineMedium.fontStyle,
              ),

              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 20.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
            ),
          ),
          actions: [],

          centerTitle: false,

          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_model.error == false)
                    Padding(
                      padding: EdgeInsets.all(24.0),
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
                              offset: Offset(0.0, 4.0),
                            ),
                          ],

                          borderRadius: BorderRadius.circular(16.0),
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,

                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    functions.montarNombreCompleto(
                                      FFAppState().usuario.nombre,
                                      FFAppState().usuario.apellidos,
                                    ),
                                    textAlign: TextAlign.center,

                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FlutterFlowTheme.of(
                                              context,
                                            ).headlineSmall.fontStyle,
                                          ),

                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).primaryText,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).headlineSmall.fontStyle,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().usuario.edad.toString(),

                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.fontStyle,
                                          ),

                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0,
                                      0.0,
                                      16.0,
                                      0.0,
                                    ),
                                    child: Container(
                                      width: double.infinity,

                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(
                                          context,
                                        ).primary,

                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),

                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.departamento?.name,
                                            'departamento',
                                          ),
                                          textAlign: TextAlign.center,

                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontStyle,
                                                ),

                                                color: Colors.white,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  if (_model.error == false)
                    Padding(
                      padding: EdgeInsets.all(24.0),
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
                              offset: Offset(0.0, 4.0),
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
                                  Icon(
                                    Icons.school_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 28.0,
                                  ),
                                  Text(
                                    'Asignaturas Impartidas',

                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FlutterFlowTheme.of(
                                              context,
                                            ).titleLarge.fontStyle,
                                          ),

                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).primaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).titleLarge.fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                              Builder(
                                builder: (context) {
                                  final asignaturasLV = _model.asignaturas
                                      .toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,

                                    primary: false,

                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: asignaturasLV.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder: (context, asignaturasLVIndex) {
                                      final asignaturasLVItem =
                                          asignaturasLV[asignaturasLVIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            PantallaAsignaturasProfesorWidget
                                                .routeName,

                                            queryParameters: {
                                              'asignatura': serializeParam(
                                                asignaturasLVItem,
                                                ParamType.DataStruct,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },

                                        child: TargetaAsignaturaProfeWidget(
                                          key: Key(
                                            'Keypnb_${asignaturasLVIndex}_of_${asignaturasLV.length}',
                                          ),
                                          asignatura: asignaturasLVItem,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  if (_model.error == true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'No se muestra nada por no estar bien',
                        textAlign: TextAlign.center,

                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(
                              context,
                            ).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(
                              context,
                            ).bodyMedium.fontStyle,
                          ),

                          color: FlutterFlowTheme.of(context).error,

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
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
