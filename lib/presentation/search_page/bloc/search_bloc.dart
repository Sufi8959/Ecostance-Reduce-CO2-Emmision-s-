import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app/dependency.dart';
import '../../../data/all_countries/repository/repository.dart';
import '../../../data/home_products/repository/repository.dart';
import '../../../domain/home_products/modal/models.dart';
import '../../home-products/widgets/sort_sheet_widget.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductsRepository productsRepository;
  final AppControllerBloc appControllerBloc;
  final ProductsBloc productsBloc;
  final repository = getIt<CountriesRepository>();
  SearchBloc(
      {required this.appControllerBloc,
      required this.productsRepository,
      required this.productsBloc})
      : super(SearchState.initial()) {
    on<Search>(
      (event, emit) async {
        emit(state.copyWith(products: []));
        if (state.isMoreLoading) {
          return;
        }

        emit(state.copyWith(isLoading: true, keyWord: event.keyWord));

        ///TODO change currency
        final result = await productsRepository.getProducts(
            appControllerBloc.state.currency, event.keyWord, 1);
        emit(result.fold(
          (failure) => state.copyWith(
              hasError: true,
              isLoading: false,
              sortMode: ProductSortModes.defaultSort,
              isMoreLoading: false),
          (data) => state.copyWith(
              metadata: data.metadata,
              currentPage: data.products.length < 4
                  ? state.currentPage
                  : state.currentPage + 1,
              isMoreLoading: false,
              hasMore: data.metadata.nextPage == null ? false : true,
              isLoading: false,
              products: [...state.products, ...data.products],
              hasError: false,
              sortMode: ProductSortModes.defaultSort),
        ));
      },
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(seconds: 1))
            .asyncExpand(mapper);
      },
    );
    on<SearchEventLoadMore>((event, emit) async {
      if (state.metadata.nextPage == null) {
        return emit(state.copyWith(
          hasMore: false,
        ));
      }
      emit(state.copyWith(isMoreLoading: true));
      final result = await productsRepository.getProducts(
          appControllerBloc.state.currency,
          state.keyWord,
          state.metadata.nextPage!);
      emit(result.fold(
        (failure) => state.copyWith(
            hasError: true,
            isLoading: false,
            sortMode: ProductSortModes.defaultSort,
            isMoreLoading: false),
        (data) => state.copyWith(
            metadata: data.metadata,
            currentPage: data.products.length < 4
                ? state.currentPage
                : state.currentPage + 1,
            isMoreLoading: false,
            hasMore: data.metadata.nextPage == null ? false : true,
            isLoading: false,
            products: [...state.products, ...data.products],
            hasError: false,
            sortMode: ProductSortModes.defaultSort),
      ));
    });
  }
}
