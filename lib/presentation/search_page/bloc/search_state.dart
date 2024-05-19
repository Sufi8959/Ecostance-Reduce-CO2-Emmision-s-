part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isLoading,
    required bool isMoreLoading,
    required int currentPage,
    required bool hasMore,
    required String keyWord,
    required List<ProductModal> products,
    required ProductSortModes sortMode,
    required bool hasError,
    required ProductsMetadata metadata,
  }) = _SearchState;

  factory SearchState.initial() =>  _SearchState(
        isLoading: false,
        products: [],
        sortMode: ProductSortModes.defaultSort,
        hasError: false,
        isMoreLoading: false,
        currentPage: 1,
        hasMore: true,
        keyWord: '', metadata: ProductsMetadata(total: 0, totalPages: 0, currentPage: 0, nextPage: 1),
      );
}
