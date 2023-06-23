import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'paginator_event.dart';
part 'paginator_state.dart';

class PaginatorBloc extends Bloc<PaginatorEvent, PaginatorState> {
  PaginatorBloc() : super(PaginatorInitial()) {
    on<NextPageChangeEvent>((event, emit) {
      if (state.page == 42) return;
      emit(state.copyWith(page: state.page + 1));
    });
    on<PreviousPageChangeEvent>((event, emit) {
      if (state.page == 1) return;
      emit(state.copyWith(page: state.page - 1));
    });
  }
}
