import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurantemobileflutter/src/03.profile/profile-edit.dart';
import 'package:restaurantemobileflutter/widgets/slide/imageScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurantemobileflutter/src/services/usuario-service.dart';

class Profilebloc extends StatefulWidget {
  @override
  _ProfileblocState createState() => _ProfileblocState();
}

class _ProfileblocState extends State<Profilebloc> {
  final List<Map> collections = [
    {"title": "Food joint", "image": "assets/food12.jpg"},
    {"title": "Photos", "image": "assets/food11.jpeg"},
    {"title": "Travel", "image": "assets/food8.jpeg"},
    {"title": "Nepal", "image": "assets/food9.jpeg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.black]),
            ),
          ),
          ListView.builder(
            itemCount: 4 + collections.length,
            itemBuilder: _mainListBuilder,
          ),
        ],
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if (index == 0) return _buildHeader(context);
    if (index == 1) return _buildSectionHeader(context);
    if (index == 2) return _buildCollectionsRow();
    if (index == 3)
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Videos",
              style: Theme.of(context).textTheme.title,
            ),
            FlatButton(
              onPressed: () {
                getGalleryImage();
              },
              child: Text(
                "Adicionar",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      );
    return _buildListItem();
  }

  Widget _buildListItem() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset('assets/1.jpg', fit: BoxFit.cover),
      ),
    );
  }

  Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Galeria",
            style: Theme.of(context).textTheme.title,
          ),
          FlatButton(
            onPressed: () {
              getGalleryImage();
            },
            child: Text(
              "Adicionar",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Container _buildCollectionsRow() {
    return Container(
      color: Colors.white,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: collections.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            //You need to make my child interactive
            onTap: () {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageScreen(collections, index),
                ),
              );
            },
            child: new Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              //width: 150.0,
              //height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(collections[index]['image'],
                              fit: BoxFit.cover))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 400.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 100.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 120.0,
                  ),
                  Text(
                    "Raffaela Caetano",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Itajai - SC"),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "302",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Posts".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "10.3K",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Seguidores".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "120",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Seguindo".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileEdit()),
                                );
                              },
                              title: Text(
                                "Editar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('assets/1.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future getGalleryImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  uploadFile(image);
}

void uploadFile(File file) {
  if (file == null) return;
  String base64Image = base64Encode(file.readAsBytesSync());
  String type = file.path.split(".").last;

  var now = new DateTime.now();
  var formatter = new DateFormat("dd-MM-yyyy_hh-mm-ss");
  String name = formatter.format(now) + ".$type";
  //print(name); // something like 2013-04-20

  const String controller = '/galeria/Upload';
  Map<String, String> post = {
    'IdUsuario': "1",
    'foto': base64Image,
    'fotoNome': name,
    'fotoPerfil': "false",
  };
  postUsuario(controller, post);
}
