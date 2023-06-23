import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/domain/repository/data_repository.dart';
import 'package:rick_and_morty_app/infraestructure/repositories/rick_repository_impl.dart';

class RepositoryRegister {
  final injector = Injector.appInstance;

  RepositoryRegister() {
    //Repositories
    injector.registerDependency<IDataRepository>(() => RickRepositoryImpl());
  }
}
