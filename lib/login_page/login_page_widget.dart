import 'package:app_firebase/auth/auth_util.dart';
import 'package:app_firebase/auth/firebase_user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../register_page/register_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  //Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppFirebaseFirebaseUser initialUser;

  TextEditingController textFieldLoginController;
  TextEditingController textFieldPasswordController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textFieldLoginController = TextEditingController();
    textFieldPasswordController = TextEditingController();
  }

  bool _isLoginFormValid() {
    if (textFieldLoginController.text.isEmpty ||
        textFieldPasswordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF4E4EFF),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 40, 50, 0),
              child: TextFormField(
                controller: textFieldLoginController,
                onChanged: (_) => EasyDebounce.debounce(
                  'textFieldLoginController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Login...',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4E4EFF),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4E4EFF),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 40, 50, 0),
              child: TextFormField(
                controller: textFieldPasswordController,
                onChanged: (_) => EasyDebounce.debounce(
                  'textFieldPasswordController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Password...',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4E4EFF),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4E4EFF),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_isLoginFormValid()) {
                    final User user = await signInWithEmail(
                        context,
                        textFieldLoginController.text,
                        textFieldPasswordController.text);

                    if (user == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Usuário ou senha inválidos")));
                      return;
                    } else {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWidget(),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Informe o login e senha")));
                  }
                },
                text: 'Logar!',
                options: FFButtonOptions(
                  width: 160,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPageWidget(),
                    ),
                  );
                },
                text: 'Cadastrar',
                options: FFButtonOptions(
                  width: 160,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryText,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
