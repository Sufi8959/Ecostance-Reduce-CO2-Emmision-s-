part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.started() = Started;
  const factory ProductsEvent.fetchInitialProducts() = ProductsEventfetchInitialProducts;
  const factory ProductsEvent.fetchProducts() = ProductsEventfetchProducts;
  const factory ProductsEvent.sortProducts(ProductSortModes sortMode) =
      SortProducts;
  const factory ProductsEvent.changeCurrency(String newCurrency) =
  ChangeCurrency;
  const factory ProductsEvent.emitProducts(List<ProductModal> products) =
  EmitProducts;
}
