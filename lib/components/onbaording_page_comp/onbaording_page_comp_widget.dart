import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onbaording_page_comp_model.dart';
export 'onbaording_page_comp_model.dart';

class OnbaordingPageCompWidget extends StatefulWidget {
  const OnbaordingPageCompWidget({
    Key? key,
    this.iconImage,
    required this.titleText,
    bool? isSkipBtnHidden,
    String? subTitleText,
    required this.skipBtnAction,
  })  : this.isSkipBtnHidden = isSkipBtnHidden ?? false,
        this.subTitleText = subTitleText ??
            'To live a full life, you have to fill your stomach first.',
        super(key: key);

  final String? iconImage;
  final String? titleText;
  final bool isSkipBtnHidden;
  final String subTitleText;
  final Future<dynamic> Function()? skipBtnAction;

  @override
  _OnbaordingPageCompWidgetState createState() =>
      _OnbaordingPageCompWidgetState();
}

class _OnbaordingPageCompWidgetState extends State<OnbaordingPageCompWidget> {
  late OnbaordingPageCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnbaordingPageCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).onboardingBgColor,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.iconImage!,
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    widget.titleText!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Outfit',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.subTitleText,
                      'To live a full life, you have to fill your stomach first.',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Container(
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x04FFFFFF),
              ),
              child: Visibility(
                visible: widget.isSkipBtnHidden,
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget.skipBtnAction?.call();
                  },
                  text: 'Skip',
                  options: FFButtonOptions(
                    height: 10.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x064B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
