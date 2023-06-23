import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/application/blocs/residents_bloc/residents_bloc.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_list_of_residents_usecase.dart';

import '../../application/blocs/blocs.dart';
import '../../domain/use_cases/get_character_by_id_usecase.dart';

class BlocRegister {
  final injector = Injector.appInstance;

  BlocRegister() {
    injector.registerSingleton<CharacterBloc>(
        () => CharacterBloc(injector.get<GetCharacterByIdUseCase>()));
    injector.registerSingleton<ResidentsBloc>(
        () => ResidentsBloc(injector.get<GetListOfResidentsUseCase>()));
  }
}
