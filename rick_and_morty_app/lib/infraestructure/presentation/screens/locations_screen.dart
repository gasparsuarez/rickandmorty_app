import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/application/blocs/residents_bloc/residents_bloc.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_list_of_residents_usecase.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_locations_by_page_usecase.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/views/location_residents_dialog_view.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/widgets/widgets.dart';

import '../../../application/blocs/blocs.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PaginatorBloc()),
        BlocProvider(
            create: (_) => LocationsBloc(Injector.appInstance.get<GetLocationsByPageUseCase>())
              ..add(const LoadLocationsEvent(page: 1))),
        BlocProvider(
            create: (_) => ResidentsBloc(Injector.appInstance.get<GetListOfResidentsUseCase>()))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Localidades'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
          backgroundColor: Colors.black87.withOpacity(0.2),
        ),
        body: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PaginatorBloc, PaginatorState>(
          builder: (context, state) {
            return PaginatorBarWidget(
                currentPage: state.page,
                maxPage: 7,
                minPage: 1,
                buttonLeftFunction: () {
                  context.read<PaginatorBloc>().add(PreviousPageChangeEvent());
                  context.read<LocationsBloc>().add(LoadLocationsEvent(page: state.page - 1));
                },
                buttonRightFunction: () {
                  context.read<PaginatorBloc>().add(NextPageChangeEvent());
                  context.read<LocationsBloc>().add(LoadLocationsEvent(page: state.page + 1));
                });
          },
        ),
        const Flexible(child: _LocationsList())
      ],
    );
  }
}

class _LocationsList extends StatelessWidget {
  const _LocationsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsBloc, LocationsState>(builder: (context, state) {
      if (state is LoadingLocationsState) {
        return const LoadingWidget();
      }
      if (state is LoadedLocationsState) {
        return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              final loc = state.list[index];
              return BounceInUp(
                child: LocationCard(
                  name: loc.name,
                  type: loc.type,
                  dimension: loc.dimension,
                  residents: loc.residents,
                ),
              );
            });
      }
      if (state is ErrorLocationsState) {
        return CustomDataErrorWidget(
          error: state.error,
        );
      }
      return const SizedBox.shrink();
    });
  }
}

class LocationCard extends StatelessWidget {
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  const LocationCard(
      {super.key,
      required this.name,
      required this.type,
      required this.dimension,
      required this.residents});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.17,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                  child: Text(name,
                      style: const TextStyle(color: Colors.amber, fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
            ]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 3),
                Row(children: [
                  const Text('Tipo: '),
                  Text(type, style: const TextStyle(color: Colors.greenAccent))
                ]),
                const SizedBox(height: 5),
                Row(children: [
                  const Text('Dimensión: '),
                  Flexible(
                      child: Text(dimension,
                          style: const TextStyle(color: Colors.redAccent),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          LocationResidentsDialog.showResidentsDialog(
                              context, _getResidentIdFromList(residents));
                        },
                        icon: const Icon(Icons.person_pin_circle_outlined),
                        label: const Text('Habitantes')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getResidentIdFromList(List<String> residents) {
    if (residents.isEmpty) return [];
    final residentsIds = <String>[];

    for (String element in residents) {
      final id = element.substring(element.length - 3).replaceAll('/', '').replaceAll('r', '');
      residentsIds.add(id);
    }
    return residentsIds;
  }
}
