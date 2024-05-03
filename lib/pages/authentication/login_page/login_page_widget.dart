import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.loginEmailTextController ??= TextEditingController();
    _model.loginEmailFocusNode ??= FocusNode();

    _model.loginPasswordTextController ??= TextEditingController();
    _model.loginPasswordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1526495124232-a04e1849168c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Login now to access intelligent trip planning,  Your passport to a smarter travel adventure awaits! ',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.loginEmailTextController,
                                      focusNode: _model.loginEmailFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Email',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .loginEmailTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 4.0, 20.0, 0.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.loginPasswordTextController,
                                      focusNode: _model.loginPasswordFocusNode,
                                      autofocus: false,
                                      obscureText:
                                          !_model.loginPasswordVisibility,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Password',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 12.0, 8.0, 12.0),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model
                                                    .loginPasswordVisibility =
                                                !_model.loginPasswordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.loginPasswordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .loginPasswordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();

                                      final user =
                                          await authManager.signInWithEmail(
                                        context,
                                        _model.loginEmailTextController.text,
                                        _model.loginPasswordTextController.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      context.goNamedAuth(
                                          'CustomNavbar', context.mounted);
                                    },
                                    text: 'Login',
                                    options: FFButtonOptions(
                                      width: 160.0,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        40.0, 40.0, 40.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              width: 70.0,
                                              child: Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            'Or sign in with',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context
                                                    .pushNamed('NotUsedFFMap');
                                              },
                                              child: SizedBox(
                                                width: 70.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                if (false)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 24.0, 20.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 50.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: SizedBox(
                                          width: 200.0,
                                          height: 50.0,
                                          child: Stack(
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  final user = await authManager
                                                      .signInWithGoogle(
                                                          context);
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  context.goNamedAuth(
                                                      'CustomNavbar',
                                                      context.mounted);
                                                },
                                                text: 'Google Sign In',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -0.78, -0.1),
                                                child: Image.asset(
                                                  'assets/images/google-color-icon.png',
                                                  width: 26.0,
                                                  height: 26.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don\'t have an account?',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 24.0, 20.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('SignUp');
                                    },
                                    text: 'Sign Up ',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 50.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 50.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
