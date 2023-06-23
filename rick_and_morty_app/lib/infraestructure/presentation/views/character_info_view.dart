import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/application/blocs/single_character_bloc/character_bloc.dart';

import '../widgets/widgets.dart';

class CharacterInfoView extends StatelessWidget {
  final String characterId;
  const CharacterInfoView({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    context.read<CharacterBloc>().add(LoadCharacterEvent(id: characterId));

    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
              (state is CharacterLoadedState) ? state.character.name : '',
              style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
            )),
            body: const _Content());
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(builder: (context, state) {
      if (state is CharacterLoadingState) {
        return const LoadingWidget();
      }
      if (state is CharacterLoadedState) {
        final char = state.character;
        return Column(
          children: [
            _CharacterLogo(imageUrl: char.image),
            _DataCard(
                status: char.status, gender: char.gender, species: char.species, type: char.type),
            _OriginCard(origin: char.origin.name),
            _LocationCard(location: char.location.name),
            _EpisodesCard(episodes: char.episodes),
          ],
        );
      }
      if (state is CharacterErrorState) {
        return CustomDataErrorWidget(error: state.error);
      }
      return const SizedBox.shrink();
    });
  }
}

class _EpisodesCard extends StatelessWidget {
  final List<String> episodes;
  const _EpisodesCard({required this.episodes});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.75,
      height: size.height * 0.15,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text('Episodios', style: Theme.of(context).textTheme.titleMedium),
              const Divider(),
              Flexible(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: episodes.length,
                    physics: (episodes.length < 2) ? const NeverScrollableScrollPhysics() : null,
                    itemBuilder: (context, index) {
                      final ep =
                          episodes[index].substring(episodes[index].length - 2).replaceAll('/', '');
                      return TextButton(onPressed: () {}, child: Text('Episodio $ep'));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DataCard extends StatelessWidget {
  final String status;
  final String gender;
  final String species;
  final String type;
  const _DataCard(
      {required this.status, required this.gender, required this.species, required this.type});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.75,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(children: [
            Text('Características', style: Theme.of(context).textTheme.titleMedium),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                _statusType(status),
                const SizedBox(height: 5),
                Text('Género: ${_genderType(gender)}'),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Especie: '),
                    Text(species, style: const TextStyle(color: Colors.greenAccent)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Tipo: '),
                    Text(type, style: const TextStyle(color: Colors.redAccent)),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  String _genderType(String gender) {
    switch (gender) {
      case 'Male':
        return 'Hombre';
      case 'Female':
        return 'Mujer';
      case 'Genderless':
        return 'Sin genero';
      default:
        return 'Desconocido';
    }
  }

  StatusWidget _statusType(String status) {
    switch (status) {
      case 'Alive':
        return const StatusWidget(color: Colors.greenAccent, status: 'Vivo/a');
      case 'Dead':
        return const StatusWidget(color: Colors.redAccent, status: 'Muerto/a');
      default:
        return const StatusWidget(color: Colors.grey, status: 'Desconocido');
    }
  }
}

class _OriginCard extends StatelessWidget {
  final String origin;
  const _OriginCard({required this.origin});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isUnknown = (origin == 'unknown') ? true : false;
    return SizedBox(
      width: size.width * 0.75,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text('Origen', style: Theme.of(context).textTheme.titleMedium),
              const Divider(),
              TextButton(
                  onPressed: isUnknown ? null : () {},
                  child: Text(isUnknown ? 'Desconocido' : origin))
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String location;
  const _LocationCard({required this.location});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isUnknown = (location == 'unknown') ? true : false;
    return SizedBox(
      width: size.width * 0.75,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text('Localidad', style: Theme.of(context).textTheme.titleMedium),
              const Divider(),
              TextButton(
                  onPressed: isUnknown ? null : () {},
                  child: Text(isUnknown ? 'Desconocido' : location))
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterLogo extends StatelessWidget {
  final String imageUrl;
  const _CharacterLogo({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.5,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
