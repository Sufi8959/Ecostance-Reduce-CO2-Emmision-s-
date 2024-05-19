part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search({required String keyWord}) = Search;
  const factory SearchEvent.loadMore() = SearchEventLoadMore;
  const factory SearchEvent.clear() = SearchEventClear;
}
