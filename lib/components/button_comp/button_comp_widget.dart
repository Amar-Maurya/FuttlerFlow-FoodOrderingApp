import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_comp_model.dart';
export 'button_comp_model.dart';

class ButtonCompWidget extends StatefulWidget {
  const ButtonCompWidget({
    Key? key,
    required this.butttonTitle,
    required this.buttonColor,
    required this.isVisible,
    int? btnElevate,
  })  : this.btnElevate = btnElevate ?? 3,
        super(key: key);

  final String? butttonTitle;
  final Color? buttonColor;
  final bool? isVisible;
  final int btnElevate;

  @override
  _ButtonCompWidgetState createState() => _ButtonCompWidgetState();
}

class _ButtonCompWidgetState extends State<ButtonCompWidget> {
  late ButtonCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: widget.isVisible ?? true,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: widget.butttonTitle!,
          options: FFButtonOptions(
            height: 50.0,
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: widget.buttonColor,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                ),
            elevation: 3.0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
