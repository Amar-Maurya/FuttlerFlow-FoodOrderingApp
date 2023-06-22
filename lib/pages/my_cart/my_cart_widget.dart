import '/components/no_data_found_card/no_data_found_card_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_cart_model.dart';
export 'my_cart_model.dart';

class MyCartWidget extends StatefulWidget {
  const MyCartWidget({Key? key}) : super(key: key);

  @override
  _MyCartWidgetState createState() => _MyCartWidgetState();
}

class _MyCartWidgetState extends State<MyCartWidget> {
  late MyCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCartModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).onboardingBgColor,
          automaticallyImplyLeading: false,
          title: Text(
            'My Cart',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final myCartPorductList =
                          FFAppState().myCart.map((e) => e).toList();
                      if (myCartPorductList.isEmpty) {
                        return NoDataFoundCardWidget(
                          isFromMyCart: true,
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: myCartPorductList.length,
                        itemBuilder: (context, myCartPorductListIndex) {
                          final myCartPorductListItem =
                              myCartPorductList[myCartPorductListIndex];
                          return ProductCardWidget(
                            key: Key(
                                'Keyq1r_${myCartPorductListIndex}_of_${myCartPorductList.length}'),
                            product: getJsonField(
                              myCartPorductListItem,
                              r'''$''',
                            ),
                            isMyCartPage: true,
                            itemIndex: myCartPorductListIndex,
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0x04FFFFFF),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().myCart.length != 0)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total Amount ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  TextSpan(
                                    text: '₹',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: functions
                                        .getTotalAmountOfMyCart(
                                            FFAppState().myCart.toList())
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().addToMyOrder(getJsonField(
                                    functions.addMyCartToOrderList(
                                        FFAppState().myCart.toList(),
                                        functions.getTotalAmountOfMyCart(
                                            FFAppState().myCart.toList())),
                                    r'''$''',
                                  ));
                                });
                                FFAppState().update(() {
                                  FFAppState().deleteMyCart();
                                  FFAppState().myCart = [];
                                });
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Order placed successfully!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .onboardingBgColor,
                                  ),
                                );
                              },
                              text: 'Place Order',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .onboardingBgColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                              showLoadingIndicator: false,
                            ),
                          ].divide(SizedBox(height: 10.0)),
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
