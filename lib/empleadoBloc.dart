import 'dart:async';
import 'empleado.dart';
import "package:flutter/material.dart";


class EmpleadoBloc {
  List<Empleado> _empleadoList = [
    Empleado(1, "Empleado 1", 1000.0),
    Empleado(2, "Empleado 2", 2000.0),
    Empleado(3, "Empleado 3", 3000.0),
    Empleado(4, "Empleado 4", 4000.0),
    Empleado(5, "Empleado 5", 5000.0)


  ];
// Streams Controller
  final _empleadoListStreamController = StreamController<List<Empleado>>();
  final _empleadoSalarioIncrementStreamController = StreamController<Empleado>();
  final _empleadoSalarioDecrementStreamController = StreamController<Empleado>();

  // Getter: Streams y sinks
  Stream <List<Empleado>> get empleadoListStream => _empleadoListStreamController.stream;
  StreamSink <List<Empleado>>  get empleadoListSink => _empleadoListStreamController.sink;

  StreamSink <Empleado> get empleadoSalarioIncrement => _empleadoSalarioIncrementStreamController.sink;
  StreamSink <Empleado> get empleadoSalarioDecrement => _empleadoSalarioDecrementStreamController.sink;

  EmpleadoBloc(){
    _empleadoListStreamController.add(_empleadoList);
    _empleadoSalarioIncrementStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioDecrementStreamController.stream.listen(_decrementSalario);

  }

  // Funciones principales (core functions)

  _incrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20/100;

    _empleadoList[empleado.id - 1].salario = salarioActual + salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

    _decrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20/100;

    _empleadoList[empleado.id - 1].salario = salarioActual - salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

  //dispose

  void dispose(){
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioDecrementStreamController.close();
    _empleadoListStreamController.close();

  }




}
