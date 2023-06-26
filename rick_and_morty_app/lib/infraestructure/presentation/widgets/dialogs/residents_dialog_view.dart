import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/widgets/character_box.dart';
import 'package:rick_and_morty_app/infraestructure/presentation/widgets/widgets.dart';

import '../../../../application/blocs/residents_bloc/residents_bloc.dart';

class LocationResidentsDialog {
  static showResidentsDialog(BuildContext context, List<String> residents) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Habitantes',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.amber),
            ),
            content: _ResidentsContent(residents),
          );
        });
  }
}

class _ResidentsContent extends StatelessWidget {
  final List<String> residents;
  const _ResidentsContent(this.residents);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
        border: Border.all(color: Colors.brown.shade600), borderRadius: BorderRadius.circular(20));
    context.read<ResidentsBloc>().add(LoadResidentsEvent(ids: residents));
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.4,
      child: DecoratedBox(
        decoration: decoration,
        child: BlocBuilder<ResidentsBloc, ResidentsState>(builder: (context, state) {
          if (state is LoadingResidentsState) {
            return const LoadingWidget();
          }
          if (state is LoadedResidentsState) {
            if (state.list.isEmpty) {
              return const Center(child: Text('No hay habitantes por aquí..'));
            }
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GridView.builder(
                  itemCount: state.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  physics: (state.list.length <= 9) ? const NeverScrollableScrollPhysics() : null,
                  itemBuilder: (context, index) {
                    final char = state.list[index];
                    return GestureDetector(
                        onTap: () {
                          context.push('/all-characters/${char.id}');
                        },
                        child: CharacterBox(imageUrl: char.image, name: char.name));
                  }),
            );
          }
          if (state is ErrorResidentsState) {
            return CustomDataErrorWidget(error: state.error);
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
