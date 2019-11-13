import 'dart:io';
import 'package:flutter/material.dart';

Widget usuarioCard(BuildContext context, int index,List lUsu){
  return GestureDetector(
    child: Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: lUsu[index].foto != null ? 
                  FileImage(File(lUsu[index].foto)) : 
                  AssetImage('assets/img/user.png')
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text( lUsu[index].nome ?? "",
                  style: TextStyle(fontSize: 22.00,
                  fontWeight: FontWeight.bold),
                  ),
                ],
              ),

            )
            ],

      ),
      ),
    ),
    );

}