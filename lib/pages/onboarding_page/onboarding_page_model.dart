import '/components/on_boarding_footer_view/on_boarding_footer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for onBoardingFooterView component.
  late OnBoardingFooterViewModel onBoardingFooterViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    onBoardingFooterViewModel =
        createModel(context, () => OnBoardingFooterViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    onBoardingFooterViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
