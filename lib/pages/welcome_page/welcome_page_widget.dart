import '/components/onbaording_page_comp/onbaording_page_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_page_model.dart';
export 'welcome_page_model.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({Key? key}) : super(key: key);

  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> {
  late WelcomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomePageModel());
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          wrapWithModel(
                            model: _model.onbaordingPageCompModel1,
                            updateCallback: () => setState(() {}),
                            child: OnbaordingPageCompWidget(
                              iconImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/f-f-products-7fig50/assets/rtiwgpgb9vsm/ONBDeleciousChkIcon.png',
                              titleText: 'Delicious Food',
                              isSkipBtnHidden: true,
                              skipBtnAction: () async {
                                context.pushNamed('OnboardingPage');
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.onbaordingPageCompModel2,
                            updateCallback: () => setState(() {}),
                            child: OnbaordingPageCompWidget(
                              iconImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/f-f-products-7fig50/assets/34j1ajez423f/ONBTruckIcon.png',
                              titleText: 'Fast Shipping',
                              isSkipBtnHidden: true,
                              skipBtnAction: () async {
                                context.pushNamed('OnboardingPage');
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.onbaordingPageCompModel3,
                            updateCallback: () => setState(() {}),
                            child: OnbaordingPageCompWidget(
                              iconImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/f-f-products-7fig50/assets/vis6t7938fok/ONBBatchIcon.png',
                              titleText: 'Certified Foods',
                              isSkipBtnHidden: true,
                              skipBtnAction: () async {
                                context.pushNamed('OnboardingPage');
                              },
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            children: [
                              wrapWithModel(
                                model: _model.onbaordingPageCompModel4,
                                updateCallback: () => setState(() {}),
                                child: OnbaordingPageCompWidget(
                                  iconImage:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/f-f-products-7fig50/assets/mk2kmmyumg32/ONBSecuredIcon.png',
                                  titleText: 'Payment Online',
                                  isSkipBtnHidden: false,
                                  skipBtnAction: () async {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 50.0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).info,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .onboardingBgColor,
                                    size: 35.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('OnboardingPage');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 4,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.SlideEffect(
                              spacing: 8.0,
                              radius: 16.0,
                              dotWidth: 15.0,
                              dotHeight: 15.0,
                              dotColor: Color(0x93FFFFFF),
                              activeDotColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
