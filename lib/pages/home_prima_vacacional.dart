import 'package:flutter/cupertino.dart';
import 'package:flutter_01_ejercicio/ejercicios/prima_vacacional.dart';
import 'package:flutter_01_ejercicio/models/prima_vacacional_item.dart';
import 'package:flutter_01_ejercicio/pages/agregar_prima_vacacional.dart';
import 'package:intl/intl.dart';

class HomePrimaVacacional extends StatefulWidget {
  const HomePrimaVacacional({super.key});

  @override
  State<HomePrimaVacacional> createState() => _HomePrimaVacacionalState();
}

class _HomePrimaVacacionalState extends State<HomePrimaVacacional> {
  List<PrimaVacacionalItem> _items = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Listado"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add), 
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => AgregarPrimaVacacional(
              onAgregar: (item) {

                setState(() {
                  _items.add(item);
                });

                Navigator.of(context).pop();
                
              }
              ,)));
          }
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _items.length,
           itemBuilder: (context, index) {
            return CupertinoListTile(
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => AgregarPrimaVacacional(
                    item: _items[index],
                    onAgregar: (item) {
                      setState(() {
                        _items[index] = item;
                      });
                      Navigator.of(context).pop();
                    }
                  )
                )
              ),
              title: Text(_items[index].nombreCompleto),
              subtitle: Text('Prima Vacacional:'
              '${NumberFormat.currency(symbol: "\$").format(_items[index].primaVacacionalBruta)}'),
              );
          })),
    );
  }
}