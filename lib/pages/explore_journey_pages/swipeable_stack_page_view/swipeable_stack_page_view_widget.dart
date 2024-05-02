import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'swipeable_stack_page_view_model.dart';
export 'swipeable_stack_page_view_model.dart';

class SwipeableStackPageViewWidget extends StatefulWidget {
  const SwipeableStackPageViewWidget({
    super.key,
    required this.document,
  });

  final PlacesRecord? document;

  @override
  State<SwipeableStackPageViewWidget> createState() =>
      _SwipeableStackPageViewWidgetState();
}

class _SwipeableStackPageViewWidgetState
    extends State<SwipeableStackPageViewWidget> {
  late SwipeableStackPageViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableStackPageViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (context) {
          final child =
              widget.document?.images.map((e) => e).toList().toList() ?? [];
          return SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: max(0, min(0, child.length - 1))),
                  scrollDirection: Axis.horizontal,
                  itemCount: child.length,
                  itemBuilder: (context, childIndex) {
                    final childItem = child[childIndex];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        childItem,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 14.0, 10.0, 0.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: max(0, min(0, child.length - 1))),
                      count: child.length,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: smooth_page_indicator.SlideEffect(
                        spacing: 10.0,
                        radius: 10.0,
                        dotWidth: 50.0,
                        dotHeight: 5.0,
                        dotColor: FlutterFlowTheme.of(context).primaryText,
                        activeDotColor: FlutterFlowTheme.of(context).primary,
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
