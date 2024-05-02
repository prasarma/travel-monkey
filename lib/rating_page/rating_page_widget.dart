import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'rating_page_model.dart';
export 'rating_page_model.dart';

class RatingPageWidget extends StatefulWidget {
  const RatingPageWidget({super.key});

  @override
  State<RatingPageWidget> createState() => _RatingPageWidgetState();
}

class _RatingPageWidgetState extends State<RatingPageWidget>
    with TickerProviderStateMixin {
  late RatingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.ratingNumberForApp, 0) != 0) {
        setState(() {
          _model.isBarrierOn = true;
          _model.activeAnimationNumber =
              valueOrDefault(currentUserDocument?.ratingNumberForApp, 0);
          _model.category =
              valueOrDefault(currentUserDocument?.ratingCategory, '');
        });
        return;
      } else {
        setState(() {
          _model.isBarrierOn = false;
        });
        return;
      }
    });

    animationsMap.addAll({
      'lottieAnimationOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.5, 0.5),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.5, 0.5),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.5, 0.5),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'lottieAnimationOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(120.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(180.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(240.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(120.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(180.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation16': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation17': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation18': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation19': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(120.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation20': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation21': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-120.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation22': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation23': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation24': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation25': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation26': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation27': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-180.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation28': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation29': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-120.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation30': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation31': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation32': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation16': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation33': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-240.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation34': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation17': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation35': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-180.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation36': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation18': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation37': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-120.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation38': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation19': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation39': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-60.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation40': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -100.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation20': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              context.pop();
            },
          ),
          title: Text(
            'Rate Us',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 75.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_model.category == 'super happy')
                              Lottie.asset(
                                'assets/lottie_animations/Animation_-_1699954437682.json',
                                height: 200.0,
                                fit: BoxFit.contain,
                                frameRate: FrameRate(60.0),
                                animate: true,
                              ).animateOnPageLoad(animationsMap[
                                  'lottieAnimationOnPageLoadAnimation1']!),
                            if (_model.category == 'depressed')
                              Lottie.asset(
                                'assets/lottie_animations/Animation_-_1699954649058.json',
                                height: 200.0,
                                fit: BoxFit.contain,
                                frameRate: FrameRate(60.0),
                                animate: true,
                              ).animateOnPageLoad(animationsMap[
                                  'lottieAnimationOnPageLoadAnimation2']!),
                            if (_model.category == 'glade')
                              Lottie.asset(
                                'assets/lottie_animations/Animation_-_1699954684650.json',
                                height: 200.0,
                                fit: BoxFit.contain,
                                frameRate: FrameRate(60.0),
                                animate: true,
                              ).animateOnPageLoad(animationsMap[
                                  'lottieAnimationOnPageLoadAnimation3']!),
                            if (_model.category == 'sad')
                              Lottie.asset(
                                'assets/lottie_animations/Animation_-_1699954807028.json',
                                height: 200.0,
                                fit: BoxFit.contain,
                                frameRate: FrameRate(60.0),
                                animate: true,
                              ).animateOnPageLoad(animationsMap[
                                  'lottieAnimationOnPageLoadAnimation4']!),
                            if (_model.category == 'happy')
                              Lottie.asset(
                                'assets/lottie_animations/Animation_-_1699954941600.json',
                                height: 200.0,
                                fit: BoxFit.contain,
                                frameRate: FrameRate(60.0),
                                animate: true,
                              ).animateOnPageLoad(animationsMap[
                                  'lottieAnimationOnPageLoadAnimation5']!),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Text(
                          'HOW WAS YOUR EXPERIENCE?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 1.0,
                        child: custom_widgets.ConfettiWidgetTest(
                          width: double.infinity,
                          height: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 40.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_model.category == 'super happy')
                              Text(
                                'It\'s Good!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.category == 'depressed')
                              Text(
                                'It\'s Bad!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.category == 'glade')
                              Text(
                                'It\'s Awesome!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.category == 'sad')
                              Text(
                                'It\'s Horrible!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.category == 'happy')
                              Text(
                                'It\'s OK!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (valueOrDefault(
                                    currentUserDocument?.ratingNumberForApp,
                                    0) !=
                                0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You\'ve already rated your experience.',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 2000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return;
                            } else {
                              return;
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.star_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 50.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.star_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 50.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.star_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 50.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.star_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 50.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: const BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.star_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 50.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.isBarrierOn = true;
                                            });
                                            setState(() {
                                              FFAppState().isConfettiOn = false;
                                            });
                                            if (_model.category ==
                                                'depressed') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    4;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation15'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation15']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation16'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation16']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation8'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation8']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/12yjasyb6ymh/Animation_-_1.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'sad';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation15'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation15']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    3;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation21'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation21']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation22'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation22']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation11'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation11']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/12yjasyb6ymh/Animation_-_1.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'sad';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation21'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation21']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'super happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    2;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation27'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation27']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation28'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation28']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation14'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation14']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/12yjasyb6ymh/Animation_-_1.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'sad';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation27'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation27']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'glade') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    1;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation33'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation33']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation34'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation34']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation17'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation17']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/12yjasyb6ymh/Animation_-_1.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'sad';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation33'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation33']!
                                                    .controller
                                                    .reset();
                                              }
                                            }

                                            setState(() {
                                              _model.isBarrierOn = false;
                                            });
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: const BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                const Icon(
                                                  Icons.star_outlined,
                                                  color: Color(0x00FFFFFF),
                                                  size: 50.0,
                                                ),
                                                if ((_model.category ==
                                                        'sad') &&
                                                    (_model.activeAnimationNumber ==
                                                        1))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation1']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation2']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation1']!,
                                                  ),
                                                if ((_model.category ==
                                                        'sad') &&
                                                    (_model.activeAnimationNumber ==
                                                        2))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation2']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation4']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation3']!,
                                                  ),
                                                if ((_model.category ==
                                                        'sad') &&
                                                    (_model.activeAnimationNumber ==
                                                        3))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation3']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation6']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation5']!,
                                                  ),
                                                if ((_model.category ==
                                                        'sad') &&
                                                    (_model.activeAnimationNumber ==
                                                        4))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation4']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation8']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation7']!,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.isBarrierOn = true;
                                            });
                                            setState(() {
                                              FFAppState().isConfettiOn = false;
                                            });
                                            if (_model.category == 'sad') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    1;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation1']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation2'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation2']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation1'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation1']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/nwlync24tbbu/Animation_-_2.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'depressed';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation1']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    4;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation23'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation23']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation24'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation24']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation12'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation12']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/nwlync24tbbu/Animation_-_2.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'depressed';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation23'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation23']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'super happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    3;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation29'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation29']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation30'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation30']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation15'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation15']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/nwlync24tbbu/Animation_-_2.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'depressed';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation29'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation29']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'glade') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    2;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation35'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation35']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation36'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation36']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation18'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation18']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/nwlync24tbbu/Animation_-_2.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'depressed';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation35'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation35']!
                                                    .controller
                                                    .reset();
                                              }
                                            }

                                            setState(() {
                                              _model.isBarrierOn = false;
                                            });
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: const BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                const Icon(
                                                  Icons.star_outlined,
                                                  color: Color(0x00FFFFFF),
                                                  size: 50.0,
                                                ),
                                                if ((_model.category ==
                                                        'depressed') &&
                                                    (_model.activeAnimationNumber ==
                                                        1))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation5']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation10']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation9']!,
                                                  ),
                                                if ((_model.category ==
                                                        'depressed') &&
                                                    (_model.activeAnimationNumber ==
                                                        2))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation6']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation12']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation11']!,
                                                  ),
                                                if ((_model.category ==
                                                        'depressed') &&
                                                    (_model.activeAnimationNumber ==
                                                        3))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation7']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation14']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation13']!,
                                                  ),
                                                if ((_model.category ==
                                                        'depressed') &&
                                                    (_model.activeAnimationNumber ==
                                                        4))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation8']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation16']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation15']!,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.isBarrierOn = true;
                                            });
                                            setState(() {
                                              FFAppState().isConfettiOn = false;
                                            });
                                            if (_model.category == 'sad') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    2;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation3'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation3']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation4'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation4']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation2'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation2']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/pe7lnw7no5g7/Animation_-_3.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation3'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation3']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'depressed') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    1;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation9'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation9']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation10'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation10']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation5'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation5']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/pe7lnw7no5g7/Animation_-_3.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation9'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation9']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'super happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    4;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation31'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation31']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation32'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation32']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation16'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation16']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/pe7lnw7no5g7/Animation_-_3.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation31'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation31']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'glade') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    3;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation37'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation37']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation38'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation38']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation19'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation19']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/pe7lnw7no5g7/Animation_-_3.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation37'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation37']!
                                                    .controller
                                                    .reset();
                                              }
                                            }

                                            setState(() {
                                              _model.isBarrierOn = false;
                                            });
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: const BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                const Icon(
                                                  Icons.star_outlined,
                                                  color: Color(0x00FFFFFF),
                                                  size: 50.0,
                                                ),
                                                if ((_model.category ==
                                                        'happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        1))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation9']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation18']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation17']!,
                                                  ),
                                                if ((_model.category ==
                                                        'happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        2))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation10']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation20']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation19']!,
                                                  ),
                                                if ((_model.category ==
                                                        'happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        3))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation11']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation22']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation21']!,
                                                  ),
                                                if ((_model.category ==
                                                        'happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        4))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation12']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation24']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation23']!,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.isBarrierOn = true;
                                            });
                                            setState(() {
                                              FFAppState().isConfettiOn = false;
                                            });
                                            if (_model.category == 'sad') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    3;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation5'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation5']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation6'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation6']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation3'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation3']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/l3260q5qlmi5/Animation_-_4.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'super happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation5'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation5']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'depressed') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    2;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation11'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation11']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation12'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation12']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation6'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation6']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/l3260q5qlmi5/Animation_-_4.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'super happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation11'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation11']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    1;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation17'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation17']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation18'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation18']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation9'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation9']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/l3260q5qlmi5/Animation_-_4.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'super happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation17'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation17']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'glade') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    4;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation39'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation39']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation40'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation40']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation20'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation20']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/l3260q5qlmi5/Animation_-_4.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'super happy';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation39'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation39']!
                                                    .controller
                                                    .reset();
                                              }
                                            }

                                            setState(() {
                                              _model.isBarrierOn = false;
                                            });
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: const BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                const Icon(
                                                  Icons.star_outlined,
                                                  color: Color(0x00FFFFFF),
                                                  size: 50.0,
                                                ),
                                                if ((_model.category ==
                                                        'super happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        1))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation13']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation26']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation25']!,
                                                  ),
                                                if ((_model.category ==
                                                        'super happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        2))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation14']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation28']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation27']!,
                                                  ),
                                                if ((_model.category ==
                                                        'super happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        3))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation15']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation30']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation29']!,
                                                  ),
                                                if ((_model.category ==
                                                        'super happy') &&
                                                    (_model.activeAnimationNumber ==
                                                        4))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation16']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation32']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation31']!,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.isBarrierOn = true;
                                            });
                                            setState(() {
                                              FFAppState().isConfettiOn = false;
                                            });
                                            if (_model.category == 'sad') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    4;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation7'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation7']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation8'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation8']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation4'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation4']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/hh847wziw0mt/Animation_-_5.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'glade';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation7'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation7']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'depressed') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    3;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation13'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation13']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation14'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation14']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation7'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation7']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/hh847wziw0mt/Animation_-_5.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'glade';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation13'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation13']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    2;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation19'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation19']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation20'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation20']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation10'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation10']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/hh847wziw0mt/Animation_-_5.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'glade';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation19'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation19']!
                                                    .controller
                                                    .reset();
                                              }
                                            } else if (_model.category ==
                                                'super happy') {
                                              setState(() {
                                                _model.activeAnimationNumber =
                                                    1;
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 5));
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation25'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation25']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation26'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation26']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation13'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation13']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.sadImg =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/hh847wziw0mt/Animation_-_5.gif';
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1005));
                                              setState(() {
                                                _model.category = 'glade';
                                              });
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation25'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation25']!
                                                    .controller
                                                    .reset();
                                              }
                                            }

                                            setState(() {
                                              _model.isBarrierOn = false;
                                            });
                                            setState(() {
                                              FFAppState().isConfettiOn = true;
                                            });
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: const BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                const Icon(
                                                  Icons.star_outlined,
                                                  color: Color(0x00FFFFFF),
                                                  size: 50.0,
                                                ),
                                                if ((_model.category ==
                                                        'glade') &&
                                                    (_model.activeAnimationNumber ==
                                                        1))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation17']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation34']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation33']!,
                                                  ),
                                                if ((_model.category ==
                                                        'glade') &&
                                                    (_model.activeAnimationNumber ==
                                                        2))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation18']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation36']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation35']!,
                                                  ),
                                                if ((_model.category ==
                                                        'glade') &&
                                                    (_model.activeAnimationNumber ==
                                                        3))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation19']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation38']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation37']!,
                                                  ),
                                                if ((_model.category ==
                                                        'glade') &&
                                                    (_model.activeAnimationNumber ==
                                                        4))
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          _model.sadImg,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'imageOnActionTriggerAnimation20']!,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation40']!,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation39']!,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.isBarrierOn)
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 55.0,
                                      decoration: const BoxDecoration(),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (valueOrDefault(currentUserDocument?.ratingNumberForApp, 0) ==
                  0)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 60.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          _model.isBarrierOn = true;
                        });

                        await currentUserReference!
                            .update(createUsersRecordData(
                          ratingNumberForApp: _model.activeAnimationNumber,
                          ratingCategory: _model.category,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Thanks for the feedback.',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                            ),
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );

                        context.pushNamed(
                          'CustomNavbar',
                          queryParameters: {
                            'currentIndex': serializeParam(
                              2,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: 160.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
