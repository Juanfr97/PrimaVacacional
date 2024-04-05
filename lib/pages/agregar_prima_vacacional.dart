import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_01_ejercicio/models/prima_vacacional_item.dart';
import 'package:intl/intl.dart';

class AgregarPrimaVacacional extends StatefulWidget {
  final PrimaVacacionalItem? item;
  const AgregarPrimaVacacional({super.key, required this.onAgregar, this.item});
  final Function(PrimaVacacionalItem) onAgregar;

  @override
  State<AgregarPrimaVacacional> createState() => _AgregarPrimaVacacionalState();
}

class _AgregarPrimaVacacionalState extends State<AgregarPrimaVacacional> {

  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _sueldoMensualController = TextEditingController();
  final _diasVacacionesController = TextEditingController();
  final _porcentajePrimaVacacionalController = TextEditingController();
  double _primaVacacionalBruta = 0;

    void _calcular(){
      setState(() {
        var sueldo = double.tryParse(_sueldoMensualController.text) ?? 0;
        var dias = int.tryParse(_diasVacacionesController.text) ?? 0;
        var porcentaje = int.tryParse(_porcentajePrimaVacacionalController.text) ?? 0;
      _primaVacacionalBruta = 
        (sueldo / 30) *
          dias *
           (porcentaje / 100);
        print(_primaVacacionalBruta);
    });
  }

  @override
  void initState(){
    // La llamada a super debe estar en el inicio
    super.initState();
    if (widget.item != null) {
    _nombreController.text = widget.item!.nombreCompleto.split(' ').first;
    _apellidoController.text = widget.item!.nombreCompleto.split(' ').skip(1).join(' ');
    _sueldoMensualController.text = widget.item!.sueldoMensualBruto.toString();
    _diasVacacionesController.text = widget.item!.diasVacaciones.toString();
    _porcentajePrimaVacacionalController.text = widget.item!.porcentajePrimaVacacional.toString();
    _primaVacacionalBruta = widget.item!.primaVacacionalBruta;
  }
    _nombreController.addListener(_calcular);
    _apellidoController.addListener(_calcular);
    _sueldoMensualController.addListener(_calcular);
    _diasVacacionesController.addListener(_calcular);
  }

  @override
  void dispose(){
    _nombreController.removeListener(_calcular);
    _apellidoController.removeListener(_calcular);
    _sueldoMensualController.removeListener(_calcular);
    _diasVacacionesController.removeListener(_calcular);
    // Se debe de llamar hasta el final, para liberar los recursos correspondientes.

    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text( widget.item == null ? "Agregar Prima Vacacional" : "Editar Prima Vacacional"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
      widget.item == null ? CupertinoIcons.add_circled : CupertinoIcons.arrow_down_to_line_alt,
        ), 
          onPressed: () {
            if(widget.item == null){
              widget.onAgregar(PrimaVacacionalItem(
                nombreCompleto: 
                  '${_nombreController.text} ${_apellidoController.text}',
                  sueldoMensualBruto: double.tryParse(_sueldoMensualController.text)!,
                  diasVacaciones: int.tryParse(_diasVacacionesController.text)!, 
                  porcentajePrimaVacacional: int.tryParse(_porcentajePrimaVacacionalController.text)!, 
                  primaVacacionalBruta: _primaVacacionalBruta));
            } else {
              widget.onAgregar(PrimaVacacionalItem(
                nombreCompleto: 
                  '${_nombreController.text} ${_apellidoController.text}',
                  sueldoMensualBruto: double.tryParse(_sueldoMensualController.text)!,
                  diasVacaciones: int.tryParse(_diasVacacionesController.text)!, 
                  porcentajePrimaVacacional: int.tryParse(_porcentajePrimaVacacionalController.text)!, 
                  primaVacacionalBruta: _primaVacacionalBruta));
            }
          }
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre + Apellido
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nombre:"),
                        CupertinoTextField(
                          controller: _nombreController,
                        )
                    ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [const Text("Apellido:"), 
                        CupertinoTextField(
                          controller: _apellidoController,
                        )],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("Sueldo Mensual Bruto:"),
              CupertinoTextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                ],
                controller: _sueldoMensualController,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("Dias de vacaciones:"),
              CupertinoTextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _diasVacacionesController,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("Porcentaje de Prima vacacional:"),
              CupertinoTextField(
                controller: _porcentajePrimaVacacionalController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                height: 1, 
                indent: 20, 
                endIndent: 20,  
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Prima Vacacional", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Empleado:"), 
                  Text("${_nombreController.text} ${_apellidoController.text}")],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Prima Vacacional:"),
                  Text(NumberFormat.currency(symbol: "\$")
                    .format(_primaVacacionalBruta))
                  ],
              ),
            ],
          ),
          ),
        )
      ),
    );
  }
}