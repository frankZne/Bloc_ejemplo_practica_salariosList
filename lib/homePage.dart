import 'package:bloc_bourboncode_hardcode/empleado.dart';
import 'package:bloc_bourboncode_hardcode/empleadoBloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
 

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final EmpleadoBloc _empleadoBloc = EmpleadoBloc();

@override
void dispose(){
  super.dispose();
  _empleadoBloc.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('App Empleado'),
      ),
      body: Container(
        child: StreamBuilder<List<Empleado>> (
          stream: _empleadoBloc.empleadoListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].id}.",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                         Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${snapshot.data[index].nombre}.",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "&. ${snapshot.data[index].salario}.",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color:  Colors.green, 
                          onPressed: (){
                            _empleadoBloc.empleadoSalarioIncrement.add(
                              snapshot.data[index]
                            );

                          }
                          ),
                      ),
                       Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_down), 
                          color:  Colors.red, 
                          onPressed: (){
                           _empleadoBloc.empleadoSalarioDecrement.add(
                            snapshot.data[index]
                           );
                          }
                          ),
                      ),
                      
                    ]
                  ),                           
                );
              },          
            );
          }
          ),
      ), 
    );
  }
}