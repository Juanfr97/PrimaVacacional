import 'package:flutter/cupertino.dart';

class Tarea {
  final String nombre;
  final bool completada;
  const Tarea({required this.nombre, required this.completada});
}

class MiListadeTareas extends StatelessWidget{
  
  const MiListadeTareas({super.key});

  @override 
  Widget build(BuildContext context)
  {
    return const CupertinoApp(
      title: "Mi lista de tareas",
      home: HomeListaTareas(),
      theme: CupertinoThemeData(
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeListaTareas extends StatelessWidget{
  const HomeListaTareas({super.key});

  @override
  Widget build(BuildContext context){
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Lista de tareas"),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8), 
          child: Column(
            children: [
              Text("Mis Actividades por hacer"),
              Expanded(child: TareasWidget(tareasIniciales: [
                Tarea(nombre: "Pasear al chucho", completada: false)
              ]))
            ],
          ),
          )
          ),
      );
      
  }
}

class TareasWidget extends StatefulWidget{
  final List<Tarea> tareasIniciales;

  const TareasWidget({super.key, required this.tareasIniciales});
  @override
  State<TareasWidget> createState() => _TareasWidgetState();

}

class _TareasWidgetState extends State<TareasWidget>{

  final TextEditingController _miTareaController = TextEditingController();
  List<Tarea> _tareas = [];
// Inicializar el state del widget
  @override
  void initState(){
    super.initState();
    _tareas = [...widget.tareasIniciales];
  }

  void agregarTarea(String tarea) {
    setState(() {
      _tareas.add(Tarea(nombre: tarea, completada: false));
    });
  }

  void eliminarTarea(int index){
    setState(() {
      _tareas.removeAt(index);
    });
  }

  void mostrarDialogoActualizacion(BuildContext context, int index){
    final TextEditingController actualizarController = TextEditingController();
    actualizarController.text = _tareas[index].nombre;

    showCupertinoDialog(context: context, builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text("ActualizarTarea"),
        content: CupertinoTextField(
          controller: actualizarController,
          placeholder: 'Nombre de la tarea',
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("Cancelar"), 
            onPressed: () {
              Navigator.of(context).pop();
          },
        ),
          CupertinoDialogAction(child: const Text("Actualizar"), 
          onPressed: () {
            setState(() {
              _tareas[index] = Tarea(
                nombre: actualizarController.text, 
                completada: _tareas[index].completada);
            });
            Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _tareas.length > 10 
        ? const Text("Tienes muchas tareas")
        : const SizedBox.shrink(),
      Row(
        children: [
          Flexible(
              child: CupertinoTextField(
            placeholder: "Añadir Tarea",
            controller: _miTareaController,
              )),
        CupertinoButton(
          onPressed: () {
            if(_miTareaController.text.isEmpty) return;
            setState(() {
              agregarTarea(_miTareaController.text);
              _miTareaController.clear();
            });
          },
          child: const Row(
            children: 
            [Text("Añadir"), 
            SizedBox(width: 10), 
            Icon(CupertinoIcons.add_circled)
            ]
          ), 
        )
        ],
      ),

      Expanded(child: ListView.builder(
        itemCount: _tareas.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () => mostrarDialogoActualizacion(context, index),
            onTap: (){
              setState(() {
                _tareas[index] = Tarea(
                  nombre: _tareas[index].nombre, 
                  completada: !_tareas[index].completada);
              });
            },
            child: Dismissible(
              key: Key(_tareas[index].nombre),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction){
                if(direction == DismissDirection.startToEnd){
                  eliminarTarea(index);
                }
              },
              child: TareaItemWidget(
                titulo: _tareas[index].nombre, 
                checked: _tareas[index].completada),
            ),
          );
        })),

      ],
    );
  }
}

class TareaItemWidget extends StatelessWidget{
  final String titulo;
  final bool checked;

  const TareaItemWidget({super.key, required this.titulo, required this.checked});


  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        color: CupertinoColors.extraLightBackgroundGray,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(titulo), CupertinoCheckbox(value: checked, onChanged: (v) => {})
          ],
      ),
      ),
    );
  }


}