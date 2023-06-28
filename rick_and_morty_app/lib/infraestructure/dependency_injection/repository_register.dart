import 'package:dio/dio.dart';
import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/infraestructure/repositories/rick_repository_impl.dart';
import 'package:rick_and_morty_app/infraestructure/services/remote/rick_morty_api_service.dart';

class RepositoryRegister {
  final injector = Injector.appInstance;
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));
  RepositoryRegister() {
    //Repositories
    injector.registerDependency<IDataRepository>(
      () => RickRepositoryImpl(
        RickMortyApiService(_dio),
      ),
    );
  }
}
