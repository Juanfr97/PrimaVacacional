import 'dart:math';

import 'package:flutter/cupertino.dart';

/**
 Los Widgets statefuls tienen 2 clases
1. La clase que extiende de StatefulWidget -> Se va a encargar de definir el estado
2. La clase que extiende de State -> Se encarga de construir el widget y manejar el estado
--
StatefulWidget -> Inmutable ( no pueden cambiar sus propiedades internas)
State -> Mutable (puede cambiar sus proiedades internas)
 */

class CambioColorWidget extends StatefulWidget{
  
  const CambioColorWidget({super.key});

  @override
  State<CambioColorWidget> createState() => _CambioColorWidgetState();

}

class _CambioColorWidgetState extends State<CambioColorWidget>
{
  Color _color = CupertinoColors.destructiveRed;

  @override 
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        CupertinoButton(
          child: const Text("Cambiar color"), 
          onPressed: () => {
            setState(() {
              _color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
            })
          }),
        Container(width: 100, height: 100, color: _color)
      ],
    );
  }
}

class ContadorWidget extends StatefulWidget{
  final int valorInicial;
  const ContadorWidget({super.key, required this.valorInicial});

  @override
  State<ContadorWidget> createState() => _ContadorWidgetState();
}

class _ContadorWidgetState extends State<ContadorWidget>{

  int _contador = 0;

  @override
  void initState(){
    super.initState();
    _contador = widget.valorInicial;
  }

  void add(){
    setState(() {
      _contador ++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(children: [
      CupertinoButton(
        child: Text("$_contador | Añadir"), 
        onPressed: () => {
          setState((){
            _contador++;
      })
    })],);
  }
}