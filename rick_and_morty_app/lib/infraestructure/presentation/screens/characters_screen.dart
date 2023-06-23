import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injector/injector.dart';
import 'package:rick_and_morty_app/domain/use_cases/get_characters_by_page_usecase.dart';

import '../../../application/blocs/blocs.dart';
import '../widgets/character_box.dart';
import '../widgets/widgets.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PaginatorBloc()),
        BlocProvider(
            create: (_) => DataBloc(Injector.appInstance.get<GetCharactersByPageUseCase>())
              ..add(LoadPageEvent(page: 1))),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personajes'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
          backgroundColor: Colors.black87.withOpacity(0.2),
        ),
        body: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PaginatorBloc, PaginatorState>(
          builder: (context, state) {
            return PaginatorBarWidget(
              currentPage: state.page,
              maxPage: 42,
              minPage: 1,
              buttonLeftFunction: () {
                context.read<PaginatorBloc>().add(PreviousPageChangeEvent());
                context.read<DataBloc>().add(LoadPageEvent(page: state.page - 1));
              },
              buttonRightFunction: () {
                context.read<PaginatorBloc>().add(NextPageChangeEvent());
                context.read<DataBloc>().add(LoadPageEvent(page: state.page + 1));
              },
            );
          },
        ),
        const Flexible(child: _CharactersList()),
      ],
    );
  }
}

class _CharactersList extends StatelessWidget {
  const _CharactersList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is DataLoadingState) {
          return const LoadingWidget();
        }
        if (state is DataLoadedState) {
          return GridView.builder(
              itemCount: state.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                final character = state.list[index];
                return GestureDetector(
                  onTap: () => context.push('/all-characters/${character.id}'),
                  child: CharacterBox(
                    name: character.name,
                    imageUrl: character.image,
                  ),
                );
              });
        }
        if (state is DataErrorState) {
          return CustomDataErrorWidget(
            error: state.error,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
