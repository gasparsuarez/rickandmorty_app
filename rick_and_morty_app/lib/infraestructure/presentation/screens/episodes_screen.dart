import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/application/blocs/episodes_bloc/episodes_bloc.dart';
import 'package:rick_and_morty_app/application/blocs/paginator_bloc/paginator_bloc.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_episodes_by_page_usecase.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/utils/date_formatter.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/widgets/widgets.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PaginatorBloc()),

        /// Init provider and load page [1]
        BlocProvider(
            create: (_) => EpisodesBloc(Injector.appInstance.get<GetEpisodesByPageUseCase>())
              ..add(const LoadPageEvent(page: 1)))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Episodios'),
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
        BlocBuilder<PaginatorBloc, PaginatorState>(builder: (context, state) {
          return PaginatorBarWidget(
            currentPage: state.page,
            maxPage: 3,
            minPage: 1,
            buttonLeftFunction: () {
              context.read<PaginatorBloc>().add(PreviousPageChangeEvent());
              context.read<EpisodesBloc>().add(LoadPageEvent(page: state.page - 1));
            },
            buttonRightFunction: () {
              context.read<PaginatorBloc>().add(NextPageChangeEvent());
              context.read<EpisodesBloc>().add(LoadPageEvent(page: state.page + 1));
            },
          );
        }),
        const Flexible(child: _EpisodesList())
      ],
    );
  }
}

class _EpisodesList extends StatelessWidget {
  const _EpisodesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      builder: (context, state) {
        if (state is LoadingEpisodesState) {
          return const LoadingWidget();
        }
        if (state is LoadedEpisodesState) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              final ep = state.list[index];
              return BounceInUp(
                child: CustomCard(
                  title: ep.name,
                  firstPropertyName: 'Lanzamiento: ',
                  secondPropertyName: 'Episodio: ',
                  firstPropertyValue: formatDateToSpanish(ep.airDate),
                  secondPropertyValue: ep.episode,
                  residents: ep.characters,
                ),
              );
            },
          );
        }
        if (state is ErrorEpisodesState) {
          return CustomDataErrorWidget(error: state.error);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
