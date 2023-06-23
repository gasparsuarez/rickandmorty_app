import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/application/blocs/paginator_bloc/paginator_bloc.dart';

void main() {
  group('Paginator Bloc ->', () {
    late PaginatorBloc paginatorBloc;

    setUp(() {
      paginatorBloc = PaginatorBloc();
      paginatorBloc.add(NextPageChangeEvent());
    });

    test('Initial state Page is [2]', () {
      expect(paginatorBloc.state.page, 2);
    });

    blocTest(
      'Emit page [+1] when NextPageChangeEvent is called ',
      build: () => paginatorBloc,
      act: (bloc) => paginatorBloc.add(NextPageChangeEvent()),
      expect: () => [isA<PaginatorState>().having((e) => e.page, 'Change to', 3)],
    );
    blocTest(
      'Emit page [-1] when PreviousPageChangeEvent is called ',
      build: () => paginatorBloc,
      act: (bloc) => paginatorBloc.add(PreviousPageChangeEvent()),
      expect: () => [isA<PaginatorState>().having((e) => e.page, 'Return to', 1)],
    );
    blocTest(
      'Emit page [-1] not found when page number is [1]',
      build: () => paginatorBloc,
      setUp: () => paginatorBloc.add(PreviousPageChangeEvent()),
      act: (bloc) => paginatorBloc.add(PreviousPageChangeEvent()),
      expect: () => [],
    );
  });
}
