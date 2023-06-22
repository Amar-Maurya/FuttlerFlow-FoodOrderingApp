import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    Key? key,
    this.product,
    bool? isMyCartPage,
    required this.itemIndex,
  })  : this.isMyCartPage = isMyCartPage ?? true,
        super(key: key);

  final dynamic product;
  final bool isMyCartPage;
  final int? itemIndex;

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late ProductCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (widget.isMyCartPage) {
            return;
          }

          context.pushNamed(
            'ProductDetailPage',
            queryParameters: {
              'product': serializeParam(
                getJsonField(
                  widget.product,
                  r'''$''',
                ),
                ParamType.JSON,
              ),
              'itemIndex': serializeParam(
                widget.itemIndex,
                ParamType.int,
              ),
              'isFromMyCart': serializeParam(
                widget.isMyCartPage,
                ParamType.bool,
              ),
            }.withoutNulls,
          );

          return;
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getJsonField(
                                widget.product,
                                r'''$.foodName''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            AutoSizeText(
                              getJsonField(
                                widget.product,
                                r'''$.description''',
                              ).toString(),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '₹ ',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: getJsonField(
                                      widget.product,
                                      r'''$.price''',
                                    ).toString(),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        Hero(
                          tag: getJsonField(
                            widget.product,
                            r'''$.imageUrl''',
                          ),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: getJsonField(
                                widget.product,
                                r'''$.imageUrl''',
                              ),
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (!widget.isMyCartPage)
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (functions
                                          .getProductQuantity(getJsonField(
                                            widget.product,
                                            r'''$''',
                                          ))
                                          .toString() !=
                                      '2') {
                                    // updatedProdAppState
                                    FFAppState().update(() {
                                      FFAppState().updateProductListAtIndex(
                                        widget.itemIndex!,
                                        (_) => getJsonField(
                                          functions.updateQuantityOfProduct(
                                              getJsonField(
                                                widget.product,
                                                r'''$''',
                                              ),
                                              false,
                                              0),
                                          r'''$''',
                                        ),
                                      );
                                    });
                                    if (functions
                                            .getIndexOfSelectedItem(
                                                FFAppState().myCart.toList(),
                                                getJsonField(
                                                  widget.product,
                                                  r'''$''',
                                                ))
                                            .toString() !=
                                        '-1') {
                                      FFAppState().update(() {
                                        FFAppState()
                                            .removeFromMyCart(getJsonField(
                                          widget.product,
                                          r'''$''',
                                        ));
                                      });
                                      FFAppState().update(() {
                                        FFAppState().addToMyCart(getJsonField(
                                          widget.product,
                                          r'''$''',
                                        ));
                                      });
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Item added successfully',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .onboardingBgColor,
                                          action: SnackBarAction(
                                            label: 'My  Cart',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            onPressed: () async {
                                              context.pushNamed('MyCart');
                                            },
                                          ),
                                        ),
                                      );
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().addToMyCart(getJsonField(
                                          widget.product,
                                          r'''$''',
                                        ));
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Item added successfully',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .onboardingBgColor,
                                          action: SnackBarAction(
                                            label: 'My  Cart',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            onPressed: () async {
                                              context.pushNamed('MyCart');
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Item out of stock ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor: Color(0xFFF72D2D),
                                      ),
                                    );
                                  }
                                },
                                text: 'ADD',
                                options: FFButtonOptions(
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .onboardingBgColor,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .onboardingBgColor,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .onboardingBgColor,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 0.5,
                                  ),
                                  hoverTextColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  hoverElevation: 5.0,
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ),
                        if (widget.isMyCartPage)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Container(
                              width: 120.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context)
                                          .onboardingBgColor
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context)
                                          .onboardingBgColor
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                      ),
                                ),
                                count: _model.countControllerValue ??=
                                    getJsonField(
                                  widget.product,
                                  r'''$.quantity''',
                                ),
                                updateCount: (count) async {
                                  setState(() =>
                                      _model.countControllerValue = count);
                                  if (widget.isMyCartPage) {
                                    // updatetheMyCart
                                    FFAppState().update(() {
                                      FFAppState().updateMyCartAtIndex(
                                        widget.itemIndex!,
                                        (_) => getJsonField(
                                          functions.updateQuantityOfProduct(
                                              getJsonField(
                                                widget.product,
                                                r'''$''',
                                              ),
                                              widget.isMyCartPage,
                                              _model.countControllerValue),
                                          r'''$''',
                                        ),
                                      );
                                    });
                                    if (functions
                                            .getProductQuantity(getJsonField(
                                              widget.product,
                                              r'''$''',
                                            ))
                                            .toString() ==
                                        '0') {
                                      FFAppState().update(() {
                                        FFAppState().updateProductListAtIndex(
                                          functions.getIndexOfSelectedItem(
                                              FFAppState().ProductList.toList(),
                                              getJsonField(
                                                widget.product,
                                                r'''$''',
                                              )),
                                          (_) => getJsonField(
                                            functions.updateQuantityOfProduct(
                                                getJsonField(
                                                  widget.product,
                                                  r'''$''',
                                                ),
                                                widget.isMyCartPage,
                                                _model.countControllerValue),
                                            r'''$''',
                                          ),
                                        );
                                      });
                                      FFAppState().update(() {
                                        FFAppState()
                                            .removeFromMyCart(getJsonField(
                                          widget.product,
                                          r'''$''',
                                        ));
                                      });
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Item removed successfully',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .onboardingBgColor,
                                          action: SnackBarAction(
                                            label: 'My  Cart',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            onPressed: () async {
                                              context.pushNamed('MyCart');
                                            },
                                          ),
                                        ),
                                      );
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().updateProductListAtIndex(
                                          functions.getIndexOfSelectedItem(
                                              FFAppState().ProductList.toList(),
                                              getJsonField(
                                                widget.product,
                                                r'''$''',
                                              )),
                                          (_) => getJsonField(
                                            functions.updateQuantityOfProduct(
                                                getJsonField(
                                                  widget.product,
                                                  r'''$''',
                                                ),
                                                false,
                                                _model.countControllerValue),
                                            r'''$''',
                                          ),
                                        );
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Item added successfully',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .onboardingBgColor,
                                          action: SnackBarAction(
                                            label: 'My  Cart',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            onPressed: () async {
                                              context.pushNamed('MyCart');
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    FFAppState().update(() {
                                      FFAppState().updateProductListAtIndex(
                                        functions.getIndexOfSelectedItem(
                                            FFAppState().ProductList.toList(),
                                            getJsonField(
                                              widget.product,
                                              r'''$''',
                                            )),
                                        (_) => getJsonField(
                                          functions.updateQuantityOfProduct(
                                              getJsonField(
                                                widget.product,
                                                r'''$''',
                                              ),
                                              false,
                                              _model.countControllerValue),
                                          r'''$''',
                                        ),
                                      );
                                    });
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Item removed successfully',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .onboardingBgColor,
                                        action: SnackBarAction(
                                          label: 'My  Cart',
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          onPressed: () async {
                                            context.pushNamed('MyCart');
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                },
                                stepSize: 1,
                                minimum: 0,
                                maximum: 2,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                              ),
                            ),
                          ),
                      ],
                    ),
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
