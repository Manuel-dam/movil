import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componentes/tutorial_component/tutorial_component_widget.dart';

// Focus widget keys for this walkthrough
final text63e6afks = GlobalKey();
final text26x3v0sb = GlobalKey();
final placeholderWidgetMuu9brgf = GlobalKey();
final containerW4ub6nbu = GlobalKey();
final placeholderWidget5dh3k2a8 = GlobalKey();

/// PantallaAlumno
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: text63e6afks,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Aqui estara tu nombre',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: text26x3v0sb,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Aqui se muestra tu edad',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: placeholderWidgetMuu9brgf,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Puedes ver la informacion de carrera',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: containerW4ub6nbu,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Al tocar la tarjeta, podras ver su descripcion',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: containerW4ub6nbu,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TutorialComponentWidget(
              texto:
                  'Y al deslizarla hacia la izquierda, te podras matricular a la carrera',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: placeholderWidget5dh3k2a8,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Y podras ver los detalles de la asignatura al pulsar',
            ),
          ),
        ],
      ),
    ];
