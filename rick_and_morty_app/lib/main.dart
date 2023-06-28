import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/infraestructure/dependency_injection/bloc_register.dart';
import 'package:rick_and_morty_app/infraestructure/dependency_injection/repository_register.dart';
import 'package:rick_and_morty_app/infraestructure/dependency_injection/usecase_register.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/app.dart';

//TODO: Agregar refresh button a las exception de conexion.

void main() {
  BlocRegister();
  RepositoryRegister();
  UseCaseRegister();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
