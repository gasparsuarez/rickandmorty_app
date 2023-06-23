import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/application/use_cases/get_list_of_residents_usecase_impl.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_list_of_residents_usecase.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_locations_by_page_usecase.dart';

import '../../application/use_cases/get_character_by_id_usecase_impl.dart';
import '../../application/use_cases/get_characters_by_page_usecase_impl.dart';
import '../../application/use_cases/get_locations_by_page_usecase_impl.dart';
import '../../domain/repository/data_repository.dart';
import '../../domain/use_cases/get_character_by_id_usecase.dart';
import '../../domain/use_cases/get_characters_by_page_usecase.dart';

class UseCaseRegister {
  final injector = Injector.appInstance;

  UseCaseRegister() {
    injector.registerDependency<GetCharactersByPageUseCase>(
        () => GetCharactersByPageUseCaseImpl(injector.get<IDataRepository>()));
    injector.registerDependency<GetCharacterByIdUseCase>(
        () => GetCharacterByIdUseCaseImpl(injector.get<IDataRepository>()));
    injector.registerDependency<GetLocationsByPageUseCase>(
        () => GetLocationsByPageUseCaseImpl(injector.get<IDataRepository>()));
    injector.registerDependency<GetListOfResidentsUseCase>(
        () => GetListOfResidentsUseCaseImpl(injector.get<IDataRepository>()));
  }
}
