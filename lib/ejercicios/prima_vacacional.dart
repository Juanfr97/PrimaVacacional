import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_01_ejercicio/models/prima_vacacional_item.dart';
import 'package:flutter_01_ejercicio/pages/home_prima_vacacional.dart';
import 'package:intl/intl.dart';

class PrimaVacacionalApp extends StatelessWidget
{
  const PrimaVacacionalApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context)
  {
    return const CupertinoApp(
      home: HomePrimaVacacional(),
      title: 'Prima Vacacional',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemIndigo,
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
