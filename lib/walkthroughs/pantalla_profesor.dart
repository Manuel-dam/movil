import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componentes/tutorial_component/tutorial_component_widget.dart';

// Focus widget keys for this walkthrough
final text6kprdkov = GlobalKey();
final textWlhsix8o = GlobalKey();
final container5r7jb877 = GlobalKey();

/// PantallaProfesor
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: text6kprdkov,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Aqui saldra tu nombre',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: textWlhsix8o,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Aqui saldra el nombre del departamento',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: container5r7jb877,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Puedes seleccionar una asignatura',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: container5r7jb877,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TutorialComponentWidget(
              texto: 'Y ver la informacion de esta asignatura',
            ),
          ),
        ],
      ),
    ];
