import 'package:flutter/cupertino.dart';

class PrimaVacacionalItem {
  final String id;
  final String nombreCompleto;
  final double sueldoMensualBruto;
  final int diasVacaciones;
  final int porcentajePrimaVacacional;
  final double primaVacacionalBruta;

  PrimaVacacionalItem({
    required this.nombreCompleto,
    required this.sueldoMensualBruto,
    required this.diasVacaciones,
    required this.porcentajePrimaVacacional,
    required this.primaVacacionalBruta
  }) : id = UniqueKey().toString();

}