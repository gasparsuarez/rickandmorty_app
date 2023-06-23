import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CharacterBox extends StatelessWidget {
  final String name;
  final String imageUrl;
  const CharacterBox({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black87), borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(imageUrl, fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return FadeIn(child: child);
              }
              return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.orange));
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 193, 7, 0.8),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange, width: 1)),
              child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(name,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 12, overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.center)),
            ),
          )
        ],
      ),
    );
  }
}
