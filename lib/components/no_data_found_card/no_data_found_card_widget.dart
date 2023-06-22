import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_data_found_card_model.dart';
export 'no_data_found_card_model.dart';

class NoDataFoundCardWidget extends StatefulWidget {
  const NoDataFoundCardWidget({
    Key? key,
    required this.isFromMyCart,
  }) : super(key: key);

  final bool? isFromMyCart;

  @override
  _NoDataFoundCardWidgetState createState() => _NoDataFoundCardWidgetState();
}

class _NoDataFoundCardWidgetState extends State<NoDataFoundCardWidget> {
  late NoDataFoundCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataFoundCardModel());
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
          color: Color(0x03FFFFFF),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            widget.isFromMyCart! ? 'Cart is Empty' : 'No Search Result Found',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).onboardingBgColor,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
