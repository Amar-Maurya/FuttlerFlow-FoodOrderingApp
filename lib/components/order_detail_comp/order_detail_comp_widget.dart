import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_detail_comp_model.dart';
export 'order_detail_comp_model.dart';

class OrderDetailCompWidget extends StatefulWidget {
  const OrderDetailCompWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
  }) : super(key: key);

  final dynamic parameter1;
  final dynamic parameter2;

  @override
  _OrderDetailCompWidgetState createState() => _OrderDetailCompWidgetState();
}

class _OrderDetailCompWidgetState extends State<OrderDetailCompWidget> {
  late OrderDetailCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderDetailCompModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F8),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        'Order Detail',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF14181B),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Color(0x024B39EF),
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor: Color(0x004B39EF),
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).onboardingBgColor,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                  child: Text(
                    'check your order below ',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF57636C),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: Color(0xFFE0E3E7),
                ),
                Builder(
                  builder: (context) {
                    final orderDetailListItems =
                        widget.parameter1?.toList() ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: orderDetailListItems.length,
                      itemBuilder: (context, orderDetailListItemsIndex) {
                        final orderDetailListItemsItem =
                            orderDetailListItems[orderDetailListItemsIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE0E3E7),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: getJsonField(
                                        orderDetailListItemsItem,
                                        r'''$.imageUrl''',
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getJsonField(
                                              orderDetailListItemsItem,
                                              r'''$.foodName''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  orderDetailListItemsItem,
                                                  r'''$.category''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Rs${getJsonField(
                                      orderDetailListItemsItem,
                                      r'''$.price''',
                                    ).toString()}',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF14181B),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Total',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF57636C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            '₹${widget.parameter2?.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF14181B),
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
