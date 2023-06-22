import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'lottie_loader_model.dart';
export 'lottie_loader_model.dart';

class LottieLoaderWidget extends StatefulWidget {
  const LottieLoaderWidget({Key? key}) : super(key: key);

  @override
  _LottieLoaderWidgetState createState() => _LottieLoaderWidgetState();
}

class _LottieLoaderWidgetState extends State<LottieLoaderWidget> {
  late LottieLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LottieLoaderModel());
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
      child: Lottie.network(
        'https://assets8.lottiefiles.com/packages/lf20_iS3ojumBx1.json',
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        fit: BoxFit.fill,
        animate: true,
      ),
    );
  }
}
