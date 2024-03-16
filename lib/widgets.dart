import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_01_ejercicio/stateful/stateful.dart';
import 'package:flutter_01_ejercicio/stateless/stateless.dart';

/**
 Dos tipos de Widgets
 StalessWidget:
 Todo su contenido es Inmutable.
 Textos, Iconos, Botones.

 StatefulWidget:
Pueden Cambiar su estado interno.
Slider, Switch, Textflied.

---
Los estados son todas las propiedades internas

 */

/*
 
 */
class MiAplicacion extends StatelessWidget {
  //constructor | el Key es un identificador unico que flutter utiliza para la reconstruccion del widget en el arbol de Widgets
  //De Fluter
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context){
    return const CupertinoApp(
      title: "Mi Aplicación",
      home: MiHomePage(),
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
    );
  }
}

class MiHomePage extends StatelessWidget{
  
  const MiHomePage({super.key});

  @override
  Widget build(BuildContext context){
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Mi pagina principal"),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text("Texto 1"),
          Text("Texto 2"),
          Text("Texto 3"),
          Texto(texto: "Mi texto en Widget"),
          Lista(),
          NewsCard(title: "Titulo", source: "Milenio", date: "13/12/1989", imagePath: "assets/images/ts.jpg"),
          CambioColorWidget(),
          ContadorWidget(valorInicial: 20)
        ],
        ),
      ));
  }
}