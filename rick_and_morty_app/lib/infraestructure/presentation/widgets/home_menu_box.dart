import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final String imageAsset;
  final String itemName;
  const MenuBox({super.key, required this.imageAsset, required this.itemName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            stops: [0.08, 0.5],
            colors: [Colors.black87, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: size.height * 0.22,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black87), borderRadius: BorderRadius.circular(20)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                )),
            Container(decoration: boxDecoration),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    itemName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
