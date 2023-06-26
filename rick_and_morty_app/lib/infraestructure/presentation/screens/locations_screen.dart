import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/application/blocs/residents_bloc/residents_bloc.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_list_of_residents_usecase.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_locations_by_page_usecase.dart';
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
                  child: CustomCard(
                title: loc.name,
                firstPropertyName: 'Tipo: ',
                secondPropertyName: 'Dimensión: ',
                firstPropertyValue: loc.type,
                secondPropertyValue: loc.dimension,
                residents: loc.residents,
              ));
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
