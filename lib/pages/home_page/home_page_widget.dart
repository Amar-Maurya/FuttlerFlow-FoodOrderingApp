import '/auth/firebase_auth/auth_util.dart';
import '/components/no_data_found_card/no_data_found_card_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions.getUserNameFromEmail(currentUserEmail),
                          'Hello',
                        ).maybeHandleOverflow(maxChars: 10),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context)
                                  .onboardingBgColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.white,
                          borderRadius: 10.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          fillColor:
                              FlutterFlowTheme.of(context).onboardingBgColor,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('MyCart');
                          },
                        ),
                        if (valueOrDefault<bool>(
                          FFAppState().myCart.length != 0,
                          false,
                        ))
                          Material(
                            color: Colors.transparent,
                            elevation: 6.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFAppState().myCart.length.toString(),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFF75F13),
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.white,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: Color(0xFF737272),
                      icon: Icon(
                        Icons.power_settings_new_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        FFAppState().update(() {
                          FFAppState().deleteMyCart();
                          FFAppState().myCart = [];
                        });
                        FFAppState().update(() {
                          FFAppState().ProductList = functions
                              .updateProductAppState(
                                  FFAppState().ProductList.toList())
                              .toList()
                              .cast<dynamic>();
                        });
                        setState(() {
                          FFAppState().deleteMyOrder();
                          FFAppState().myOrder = [];
                        });

                        context.pushNamedAuth('LoginPage', context.mounted);
                      },
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).onboardingBgColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final porductListData =
                        FFAppState().ProductList.map((e) => e).toList();
                    if (porductListData.isEmpty) {
                      return NoDataFoundCardWidget(
                        isFromMyCart: false,
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: porductListData.length,
                      itemBuilder: (context, porductListDataIndex) {
                        final porductListDataItem =
                            porductListData[porductListDataIndex];
                        return ProductCardWidget(
                          key: Key(
                              'Keyqqp_${porductListDataIndex}_of_${porductListData.length}'),
                          product: getJsonField(
                            porductListDataItem,
                            r'''$''',
                          ),
                          isMyCartPage: false,
                          itemIndex: porductListDataIndex,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
