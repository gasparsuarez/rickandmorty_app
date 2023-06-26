import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        _CustomAppBar(),
        _Menu(),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: false,
        elevation: 0,
        expandedHeight: 50,
        backgroundColor: Colors.black87.withOpacity(0.2),
        flexibleSpace: FlexibleSpaceBar(
          background: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                  child: Image.asset(
                'assets/rick_and_morty.png',
              ))
            ],
          ),
        ));
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _screenNavigation(index, context),
            child: MenuBox(
              imageAsset: _getImageOfAssets(index),
              itemName: _getNamesForItems(index),
            ),
          );
        });
  }

  _screenNavigation(int index, BuildContext context) {
    switch (index) {
      case 0:
        return context.push('/all-characters');
      case 1:
        return context.push('/locations');
      case 2:
        return context.push('/episodes');
      default:
        context.go('/');
    }
  }

  ///get names for menu items
  String _getNamesForItems(int index) {
    switch (index) {
      case 0:
        return 'Personajes';
      case 1:
        return 'Localidades';
      case 2:
        return 'Episodios';
      default:
        return '';
    }
  }

  ///get images of assets for menu items
  String _getImageOfAssets(int index) {
    switch (index) {
      case 0:
        return 'assets/menu_characters.png';
      case 1:
        return 'assets/menu_location.png';
      case 2:
        return 'assets/menu_episodes.png';
      default:
        return '';
    }
  }
}

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
