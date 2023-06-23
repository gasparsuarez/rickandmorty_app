import 'package:go_router/go_router.dart';

import '../../infraestructure/presentation/screens/screens.dart';
import '../../infraestructure/presentation/views/views.dart';

class RouterApp {
  static final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/all-characters',
        builder: (context, state) => const CharactersScreen(),
        routes: [
          GoRoute(
              path: ':id',
              builder: (context, state) {
                final characterId = state.pathParameters['id'] ?? 'no-id';
                return CharacterInfoView(characterId: characterId);
              })
        ]),
    GoRoute(path: '/locations', builder: (context, state) => const LocationScreen()),
  ]);
}
