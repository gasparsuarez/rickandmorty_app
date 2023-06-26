import 'package:flutter/material.dart';

import 'dialogs/residents_dialog_view.dart';

enum CardType {
  location,
  episode,
}

class CustomCard extends StatelessWidget {
  final String title;
  final String firstPropertyValue;
  final String secondPropertyValue;
  final List<String> residents;
  final CardType type;

  const CustomCard(
      {super.key,
      required this.title,
      required this.firstPropertyValue,
      required this.secondPropertyValue,
      required this.residents,
      required this.type});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.17,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                  child: Text(title,
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
                  Text(type == CardType.episode ? 'Lanzamiento: ' : 'Tipo: '),
                  Text(firstPropertyValue, style: const TextStyle(color: Colors.greenAccent))
                ]),
                const SizedBox(height: 5),
                Row(children: [
                  Text(type == CardType.episode ? 'Episodio: ' : 'Dimensión: '),
                  Flexible(
                      child: Text(secondPropertyValue,
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
                        label: Text(type == CardType.episode ? 'Personajes' : 'Habitantes')),
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
