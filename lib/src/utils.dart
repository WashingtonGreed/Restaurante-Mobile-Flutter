import 'package:flutter/material.dart';
import 'package:restaurantemobileflutter/style/theme.dart' as Themme;


String validatorEmail (String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return '';
    else
      return value;
  }

  bool validator(List<String> value, int user, BuildContext context, var _scaffoldKey) {
    if (value.contains("")) {
      String textfield = value[value.indexOf('') + 1];
      showInSnackBar(context,_scaffoldKey,textfield);
      return false;
    } else if (user == 0) {
      if (value[5] == value[7] && value[5].length >= 8) {
        // ir para tela principal
      } else if (value[4] != value[6]) {
        showInSnackBar(context,_scaffoldKey,"As senhas não coincidem. Tente novamente.");
        return false;
      } else if (value[4].length < 8) {
        showInSnackBar(context,_scaffoldKey,"A senha é muito curta, Use 8 digitos ou mais.");
        return false;
      }
    } else
      showInSnackBar(context,_scaffoldKey,"Processando Dados");
    return true;
  }

void showInSnackBar(BuildContext context, var _scaffoldKey, String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: Themme.FontSize.medium,
            fontFamily: Themme.FontFamily.WorkSansSemiBold),
      ),
      backgroundColor: Themme.Colors.loginGradientStart,
      duration: Duration(seconds: 3),
    ));
  }
  
  
