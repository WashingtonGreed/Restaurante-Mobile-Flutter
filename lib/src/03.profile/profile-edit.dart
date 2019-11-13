import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurantemobileflutter/src/models/Usuario.dart';
import 'package:restaurantemobileflutter/src/utils.dart';
import 'package:restaurantemobileflutter/style/theme.dart' as Themme;
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurantemobileflutter/src/services/usuario-service.dart';

class ProfileEdit extends StatefulWidget {
  
  final Usuario usuario;

  ProfileEdit({this.usuario});

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

TextEditingController emailController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController confirmPasswordController = new TextEditingController();

final FocusNode myFocusNodeName = FocusNode();
final FocusNode myFocusNodePassword = FocusNode();
final FocusNode myFocusNodeEmail = FocusNode();

bool _obscureTextSignup = true;
bool _obscureTextSignupConfirm = true;

class _ProfileEditState extends State<ProfileEdit> {

  Usuario _usuarioEdit;

  @override
  void initState(){
    super.initState();

    if(widget.usuario==null){

      _usuarioEdit = Usuario();

    }else{
      _usuarioEdit =widget.usuario;
     // emailController.text = _usuarioEdit.email;
      //nameController.text = _usuarioEdit.nome;
      //passwordController.text = _usuarioEdit.senha;
      //confirmPasswordController.text = _usuarioEdit.senha;
      print(_usuarioEdit.email);
    }
  }

  void _toggleConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  void _toggle() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Perfil"),
      ),
      key: _scaffoldKey,
      body: 
      Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.black]),
            ),
          ),
          ListView.builder(
            itemCount: 1,
            itemBuilder: _buildHeader,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return 
    SingleChildScrollView(
      child:
    Stack(
      alignment: Alignment.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        Card(
          elevation: 2.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: 300.0,
            height: 360.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextField(
                    focusNode: myFocusNodeName,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                        fontFamily: Themme.FontFamily.WorkSansSemiBold,
                        fontSize: Themme.FontSize.medium,
                        color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        FontAwesomeIcons.user,
                        color: Colors.black,
                      ),
                      hintText: "Nome",
                      hintStyle: TextStyle(
                          fontFamily: Themme.FontFamily.WorkSansSemiBold,
                          fontSize: Themme.FontSize.medium),
                    ),
                  ),
                ),
                Container(
                  width: 250.0,
                  height: 1.0,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextField(
                    focusNode: myFocusNodeEmail,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontFamily: Themme.FontFamily.WorkSansSemiBold,
                        fontSize: Themme.FontSize.medium,
                        color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        FontAwesomeIcons.envelope,
                        color: Colors.black,
                      ),
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                          fontFamily: Themme.FontFamily.WorkSansSemiBold,
                          fontSize: Themme.FontSize.medium),
                    ),
                  ),
                ),
                Container(
                  width: 250.0,
                  height: 1.0,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextField(
                    focusNode: myFocusNodePassword,
                    controller: passwordController,
                    obscureText: _obscureTextSignup,
                    style: TextStyle(
                        fontFamily: Themme.FontFamily.WorkSansSemiBold,
                        fontSize: Themme.FontSize.medium,
                        color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        FontAwesomeIcons.lock,
                        color: Colors.black,
                      ),
                      hintText: "Senha",
                      hintStyle: TextStyle(
                          fontFamily: Themme.FontFamily.WorkSansSemiBold,
                          fontSize: Themme.FontSize.medium),
                      suffixIcon: GestureDetector(
                        onTap: _toggle,
                        child: Icon(
                          _obscureTextSignup
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Themme.FontSize.small,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 250.0,
                  height: 1.0,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextField(
                    controller: confirmPasswordController,
                    obscureText: _obscureTextSignupConfirm,
                    style: TextStyle(
                        fontFamily: Themme.FontFamily.WorkSansSemiBold,
                        fontSize: Themme.FontSize.medium,
                        color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        FontAwesomeIcons.lock,
                        color: Colors.black,
                      ),
                      hintText: "Confirme a Senha",
                      hintStyle: TextStyle(
                          fontFamily: Themme.FontFamily.WorkSansSemiBold,
                          fontSize: Themme.FontSize.medium),
                      suffixIcon: GestureDetector(
                        onTap: _toggleConfirm,
                        child: Icon(
                          _obscureTextSignupConfirm
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Themme.FontSize.small,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 340.0, bottom: 20.0),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Themme.Colors.loginGradientStart,
                offset: Offset(1.0, 6.0),
                blurRadius: 20.0,
              ),
              BoxShadow(
                color: Themme.Colors.loginGradientEnd,
                offset: Offset(1.0, 6.0),
                blurRadius: 20.0,
              ),
            ],
            gradient: new LinearGradient(
                colors: [
                  Themme.Colors.loginGradientStart,
                  Themme.Colors.loginGradientEnd
                ],
                begin: const FractionalOffset(0.2, 0.2),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: Themme.Colors.loginGradientEnd,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
              child: Text(
                "SALVAR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Themme.FontSize.larger,
                    fontFamily: Themme.FontFamily.WorkSansSemiBold),
              ),
            ),

            onPressed: () async {
              //await  _showLoadingHud(context);

              List<String> fields = [
                nameController.text.trim(),
                "Informe seu Nome",
                validatorEmail(emailController.text.trim()),
                "Informe um E-mail valido",
                passwordController.text.trim(),
                "Digite uma Senha",
                confirmPasswordController.text.trim(),
                "Confirme sua Senha"
              ];
              const controller = 'usuarios/usuarios/1';
              Map<String, String> post = {
                'Nome': nameController.text,
                'Email': emailController.text,
                'Senha': passwordController.text,
              };

              if (validator(fields, 0, this.context, _scaffoldKey)) {
                _scaffoldKey.currentState.showSnackBar(new SnackBar(
                  duration: new Duration(seconds: 4),
                  content: new Row(
                    children: <Widget>[
                      new CircularProgressIndicator(),
                      new Text(
                          "    Salvando!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Themme.FontSize.medium,
                              fontFamily: Themme.FontFamily.WorkSansSemiBold),
                        )
                      ],
                    ),
                    backgroundColor: Themme.Colors.loginGradientStart,));
                postUsuario(controller, post)
                    .whenComplete(
                        () => Navigator.of(context).pushNamed("/BottomNavBar"))
                    .catchError((onError, stackTrace) {
                  _scaffoldKey.currentState.showSnackBar(new SnackBar(
                    duration: new Duration(seconds: 3),
                    content: new Row(
                      children: <Widget>[
                        new CircularProgressIndicator(),
                        new Text(
                          "    Ocorreu um erro ao tentar Salvar!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Themme.FontSize.medium,
                              fontFamily: Themme.FontFamily.WorkSansSemiBold),
                        )
                      ],
                    ),
                    backgroundColor: Themme.Colors.loginGradientStart,
                  ));
                });
                await postUsuario(controller, post);
              }
            },
          ),
        )
      ],
    ),
    );
  }

  Widget _buildHeader(BuildContext context, int index) {
    return new Container(
      padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Column(
        children: <Widget>[buildHeader(), _buildBody()],
      ),
    );
  }
}


Widget buildHeader() {
  return Container(
    height: 200.0,
    child: Stack(
      children: <Widget>[
        Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/1.jpg',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 9.0,
          right: 9.0,
          child: InkWell(
            onTap: () {
              getGalleryImage(true);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 40.0,
                width: 40.0,
                margin: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Future getGalleryImage(bool perfil) async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  uploadFile(image, perfil);
}

void uploadFile(File file, bool perfil) {
  if (file == null) return;
  String base64Image = base64Encode(file.readAsBytesSync());
  String type = file.path.split(".").last;

  var now = new DateTime.now();
  var formatter = new DateFormat("dd-MM-yyyy_hh-mm-ss");
  String name = formatter.format(now) + ".$type";

  const String controller = '/galeria/Upload';
  Map<String, String> post = {
    'IdUsuario': "1",
    'foto': base64Image,
    'fotoNome': name,
    'fotoPerfil': perfil.toString(),
  };
  postUsuario(controller, post);
}