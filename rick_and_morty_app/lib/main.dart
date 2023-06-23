import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/infraestructure/dependency_injection/bloc_register.dart';
import 'package:rick_and_morty_app/infraestructure/dependency_injection/repository_register.dart';
import 'package:rick_and_morty_app/infraestructure/dependency_injection/usecase_register.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/app.dart';

void main() {
  BlocRegister();
  RepositoryRegister();
  UseCaseRegister();
  runApp(const MyApp());
}
