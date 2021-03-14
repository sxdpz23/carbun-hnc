import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/services/authenticate.dart';
import 'package:carbun/shared/loading.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  String _error;
  bool loading = false;

  final FocusNode mailFocus = FocusNode(), passFocus = FocusNode();
  TextEditingController mailText = TextEditingController(text: ''),
      passText = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width,
        _height = MediaQuery.of(context).size.height;

    Widget _screen() => SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              height: _height,
              width: _width,
              color: textColor,
              alignment: Alignment.center,
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          'Login & Signup',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'Itim',
                              fontSize: 36.0,
                              letterSpacing: 2.0),
                        ),
                      ),
                    ),
                    Container(
                      width: _width,
                      height: 60.0,
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: primaryColor,
                      ),
                      child: TextFormField(
                        focusNode: mailFocus,
                        controller: mailText,
                        autofocus: false,
                        validator: (val) => val.length < 10
                            ? 'Enter a valid Mail address'
                            : null,
                        decoration: InputDecoration(
                            hintText: 'Mail',
                            hintStyle: TextStyle(
                                color: accentColor, fontFamily: 'Itim'),
                            border: InputBorder.none),
                        style:
                            TextStyle(color: accentColor, fontFamily: 'Itim'),
                        onChanged: (value) => print(value),
                      ),
                    ),
                    Container(
                      width: _width,
                      height: 60.0,
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: primaryColor,
                      ),
                      child: TextFormField(
                        focusNode: passFocus,
                        controller: passText,
                        validator: (val) => val.length < 6
                            ? 'Enter a Password 6+ char long'
                            : null,
                        autofocus: false,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: accentColor, fontFamily: 'Itim'),
                            border: InputBorder.none),
                        style:
                            TextStyle(color: accentColor, fontFamily: 'Itim'),
                        onChanged: (value) => print(value),
                        obscureText: true,
                        obscuringCharacter: '*',
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                              2,
                              (index) => GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = index == 0
                                            ? await _auth.signIn(
                                                mailText.text, passText.text)
                                            : await _auth.register(
                                                mailText.text, passText.text);
                                        if (this.mounted) {
                                          if (result == null) {
                                            setState(() {
                                              _error =
                                                  'Please give the correct credentials';
                                              loading = false;
                                            });
                                          } else {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              _error = index == 0
                                                  ? 'Successfully Logged In!!'
                                                  : 'Successfully Signed Up!!';
                                              loading = false;
                                            });
                                          }
                                        }
                                      }
                                      if (_error != null) {
                                        if (this.mounted) {
                                          final _snackbar = SnackBar(
                                            content: Text(_error),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(_snackbar);
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 50.0,
                                      width: _width * 0.4,
                                      decoration: BoxDecoration(
                                          color: index == 0
                                              ? secondaryColor
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(100.0)),
                                      child: Center(
                                        child: Text(
                                          index == 0 ? 'LOGIN' : 'SIGNUP',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: primaryColor,
                                              letterSpacing: 4.0,
                                              fontFamily: 'Itim',
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: primaryColor,
      body: loading
          ? Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  child: _screen(),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    child: Center(child: Loading()),
                  ),
                ),
              ],
            )
          : _screen(),
    );
  }
}
